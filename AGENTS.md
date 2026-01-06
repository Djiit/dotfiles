# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **dotfiles repository** managed by [chezmoi](https://www.chezmoi.io/), a dotfile manager that uses templating to maintain consistent configuration across multiple machines (macOS, Linux, and SteamDeck).

## Chezmoi Fundamentals

### File Naming Conventions

Chezmoi uses special prefixes to determine how files are processed:

- `dot_` → becomes `.` (e.g., `dot_gitconfig` → `.gitconfig`)
- `.tmpl` → templated file that gets processed with Go templates
- `run_once_` → script that runs once (tracked by checksum)
- `run_onchange_` → script that runs when the file changes
- `modify_` → script that modifies an existing file

### Key Commands

```bash
# Apply dotfiles from this source directory
chezmoi apply

# Test changes without applying
chezmoi diff

# Re-run setup (useful after editing templates/scripts)
chezmoi init --apply

# Edit a dotfile
chezmoi edit ~/.gitconfig

# Update source and apply
chezmoi update

# See what chezmoi would do
chezmoi status
```

## Architecture

### Configuration Data

All configuration data lives in `.chezmoidata/*.yml`:

- `packages.yml` - Package lists for Homebrew (taps, brews, casks), apt, pipx, flatpak, and custom binaries
- `aliases.yml` - Shell aliases dynamically loaded into zshrc
- `zsh.yml` - ZSH plugin configuration
- `gh-extensions.yml` - GitHub CLI extensions

Templates reference this data using Go template syntax: `{{ .packages.darwin.casks }}`, `{{ .aliases }}`, etc.

### Template Variables

The `.chezmoi.yaml.tmpl` file defines key variables:

- `.work` - Boolean for work vs personal setup (affects which `.gitconfig` is used)
- `.name` / `.email` - User details for git config
- `.codespaces` - Detects GitHub Codespaces environment
- `.chezmoi.os` - Operating system (darwin, linux)
- `.chezmoi.arch` - Architecture (arm64, amd64)
- `.chezmoi.osRelease.id` - Linux distribution ID (e.g., "steam" for SteamDeck)

### Installation Flow

1. `run_once_00_install-package-managers.sh.tmpl` - Installs Homebrew (skipped on arm64)
2. `run_once_01_install-zsh.sh.tmpl` - Installs ZSH if needed
3. `run_onchange_02_install-packages.sh.tmpl` - Installs all packages from `packages.yml`:
   - Custom binaries via curl install scripts (mise, direnv, starship, zoxide, atuin)
   - APT packages and sources (Linux only)
   - Homebrew taps, formulae, and casks (OS-specific)
   - pipx packages
4. `run_onchange_03_install-gh-extensions.sh.tmpl` - Installs GitHub CLI extensions

### Shell Configuration

- `dot_zshrc.d/00_init.sh.tmpl` - Environment initialization (PATH, tool setup)
- `dot_zshrc.d/01_aliases.sh.tmpl` - Contains custom shell aliases and functions
- `modify_dot_zshrc` - Modifies existing `.zshrc` to set ZSH plugins

### Key Tools and Aliases

**GitHub Workflow:**
- `ghpr [description]` - Push branch and create draft PR with template

**Jira CLI Workflow:**
- `jme` - List my active Jira issues
- `jc` - Create Story with template
- `jpes` - Create in PES project
- `jcfoo`, `jcbar` - Create with specific labels
- `jcm` - FOO + Monolith scope
- `jcs` - BAR + Multi-Services scope
- `jcia` - Create Task in BWA project
- `jsearch <query>` - Search EN project by summary

### Platform-Specific Behavior

The `.chezmoiignore` file controls what gets applied:

- **Work environments** (`.work=true` and not Codespaces): Uses `dot_gitconfig.tmpl`, ignores `dot_gitconfig-djiit.tmpl`
- **Personal/Codespaces**: Uses `dot_gitconfig-djiit.tmpl`, ignores `dot_gitconfig.tmpl`
- **SteamDeck** (`osRelease.id=steam`): Only applies `*steamdeck*` files

## Development Workflow

### Adding New Packages

1. Edit `.chezmoidata/packages.yml` to add package to appropriate section:
   - `packages.common.binaries` - Custom install scripts (with name and command)
   - `packages.common.taps/brews` - Common Homebrew packages
   - `packages.darwin.taps/brews/casks` - macOS-specific
   - `packages.linux.apt` - Linux APT packages
   - `packages.common.pipx` - Python tools via pipx
2. Run `chezmoi apply` to trigger `run_onchange_02_install-packages.sh.tmpl`

### Adding New Aliases

1. Edit `.chezmoidata/aliases.yml`:
   ```yaml
   aliases:
     - name: "myalias"
       command: "echo hello"
   ```
2. Run `chezmoi apply` to regenerate `~/.zshrc.d/01_aliases.sh`

### Modifying Templates

When editing `.tmpl` files:
1. Make changes in the source directory (`~/.local/share/chezmoi`)
2. Test with `chezmoi diff`
3. Apply with `chezmoi apply`

### Testing Changes

Use the devcontainer to test changes in a clean environment (mentioned in README.md).

## Important Notes

- Homebrew installation is **skipped on arm64 architecture**
- The `modify_dot_zshrc` script uses regex replacement to manage ZSH plugins
- Git configuration switches between work and personal based on environment detection
- All `run_onchange_*` scripts re-run when their content changes (enables package updates)
