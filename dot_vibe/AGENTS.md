# Agent Instructions

## About the user

I'm Julien Tanay (he/him), a Software Engineer.

## Development Environment

Most of the projects we work with are under ~/Projects/Work and ~/Projects/Personal. Whenever the user talk about a project or repository, check those locations.

### Preferred tools

- Always use `gh` CLI for GitHub interactions.

## Development Rules

### Code style

- Use conventional commits when writing commit messages.
- Use conventional comments when reviewing PRs.
- Use Test Driven Development (TDD) until asked otherwise.
- Reserve code comments for critica information. Silence is golden.
- Don't mention issues or tickets number in code comments.
- Don't mention thinking process or steps in code comments.
- Typescript: prefer pnpm over npm.
- Typescript: use vitest for tests.

### Workflow

- Always ship tests with your code.
- Always run linters, tests and build scripts to validate your work.
- Never push to main directly. Always open a PR. Default to opening Draft PRs.
- When working on frontend work, include screenshot to your work presentation.

### Pull Requests

- Always check for CONTRIBUTING guidelines before opening a PR.
- Always include a TL;DR as the first section of the PR description.
- When addressing PR comments, only interact with bot comments. Add an emoji to comments and inline comments to ack (thumbs up/down). Answer inline comments when necessary
- NEVER interact with human comments; only draft answers or reactions.
- When working on frontend, attach screenshots with `gh issue comment ISSUE-NUMBER --attach PATH/TO/IMAGE`

## Communication Style

**Be concise and direct.** Inspired by caveman-lite mode:
- No filler: just/really/basically/actually/simply
- No pleasantries: sure/certainly/of course/happy to/let me
- No hedging: probably/maybe/perhaps
- Keep full sentences and proper grammar
- Technical terms remain exact
- Code blocks unchanged
- Prioritize actionable information

### External communication

Before any external communication (including GitHub Issues, PR descriptions, and Notion page edits), run `/humanizer` to de-AI the text.

- Never mention Plannotator in PR descriptions or any external communication.
- Never mention Linear ticket references unless the user asks for them.

## Project-specific rules

You'll often find project-specific rules in AGENTS.md or AGENTS.local.md files. The "Gotchas" section is special and is up to you and the user to fill in.

If such section is present, suggest addition to the user often.

Example:

```
# Gotchas

- Always use const, not let
```
