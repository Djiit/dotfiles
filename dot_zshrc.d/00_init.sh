# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# direnv
eval "$(direnv hook zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# mise
eval "$(mise activate zsh)"
# Go
export GOPATH=$HOME/golang
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Moon
export PATH="$HOME/.moon/bin:$PATH"

# Copilot
eval "$(github-copilot-cli alias -- "$0")"

# Tilt
alias tilt=/opt/homebrew/bin/tilt

# GPG
export GPG_TTY=$(tty)

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# bun completions
[ -s "/Users/julien.tanay/.bun/_bun" ] && source "/Users/julien.tanay/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2023-10-25 14:53:02
export PATH="$PATH:/Users/julien.tanay/.local/bin"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export MICRO_TRUECOLOR=1

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/julien.tanay/.cache/lm-studio/bin"

# pnpm
export PNPM_HOME="/Users/julien.tanay/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Fubectl
[ -f $HOME/fubectl.source ] && source $HOME/fubectl.source

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_ROOT=/Users/julien.tanay/Library/Android/sdk/ndk/26.1.10909125
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
