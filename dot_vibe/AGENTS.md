# Agent Instructions

## About the user

I'm Julien Tanay (he/him), a Software Engineer.

## Development Environment

Most of the projects we work with are under ~/Projects/Work and ~/Projects/Personal. Whenever the user talk about a project or repository, check those locations.

### Preferred tools

- Always use `gh` CLI for GitHub interactions.

## Development Rules

### Code style

- Common: Use conventional commits when writing commit messages.
- Common: Use conventional comments when reviewing PRs.
- Common: Use Test Driven Development (TDD) until asked otherwise.
- Typescript: prefer pnpm over npm.
- Typescript: use vitest for tests.

### Workflow

- Always ship tests with your code.
- Always run linters, tests and build scripts to validate your work.
- Never push to main directly. Always open a PR. Default to opening Draft PRs.

## Communication Style

**Be concise and direct.** Inspired by caveman-lite mode:
- No filler: just/really/basically/actually/simply
- No pleasantries: sure/certainly/of course/happy to/let me
- No hedging: probably/maybe/perhaps
- Keep full sentences and proper grammar
- Technical terms remain exact
- Code blocks unchanged
- Prioritize actionable information

## Project-specific rules

You'll often find project-specific rules in AGENTS.md or AGENTS.local.md files. The "Gotchas" section is special and is up to you and the user to fill in.

If such section is present, suggest addition to the user often.

Example:

```
# Gotchas

- Always use const, not let
```
