#!/usr/bin/env zsh

# Git worktree helper - creates a worktree in temp dir and launches claude
# Usage:
#   wtclaude <branch-name>  - Create worktree for branch (creates if doesn't exist)
#   wtclaude --list         - List all temporary worktrees
#   wtclaude --cleanup      - Remove all temporary worktrees

wtclaude() {
  # Handle flags
  if [ "$1" = "--list" ]; then
    echo "Temporary worktrees:"
    echo "===================="
    local found=0
    local worktrees=()

    # Parse worktree list into array
    while IFS= read -r line; do
      if [[ "$line" == worktree* ]]; then
        local wt_path="${line#worktree }"
        if [[ "$wt_path" == *"/git-worktree-"* ]]; then
          found=1
          worktrees+=("$wt_path")
        fi
      fi
    done < <(git worktree list --porcelain 2>/dev/null)

    # Display worktrees
    if [ $found -eq 1 ]; then
      for wt in "${worktrees[@]}"; do
        # Get branch name for this worktree
        local branch=$(git worktree list --porcelain 2>/dev/null | awk -v wt="$wt" '
          $0 == "worktree " wt { getline; if ($1 == "branch") { sub("^branch refs/heads/", ""); print; exit } }
        ')
        echo "  📁 $wt"
        if [ -n "$branch" ]; then
          echo "     └─ Branch: $branch"
        fi
      done
    else
      echo "  (none found)"
    fi
    return 0
  fi

  if [ "$1" = "--cleanup" ]; then
    echo "Cleaning up temporary worktrees..."
    local count=0
    local worktrees=()

    # Collect temp worktrees
    while IFS= read -r line; do
      if [[ "$line" == worktree* ]]; then
        local wt_path="${line#worktree }"
        if [[ "$wt_path" == *"/git-worktree-"* ]]; then
          worktrees+=("$wt_path")
        fi
      fi
    done < <(git worktree list --porcelain 2>/dev/null)

    # Remove them
    if [ ${#worktrees[@]} -eq 0 ]; then
      echo "  No temporary worktrees to clean up"
    else
      for wt in "${worktrees[@]}"; do
        echo "  Removing: $wt"
        if git worktree remove "$wt" --force 2>&1 | grep -v "^$"; then
          ((count++))
        else
          ((count++))
        fi
      done
      echo "✓ Cleaned up $count worktree(s)"
    fi
    return 0
  fi

  # Normal worktree creation flow
  if [ -z "$1" ]; then
    echo "Usage:"
    echo "  wtclaude <branch-name>  - Create worktree for branch"
    echo "  wtclaude --list         - List all temporary worktrees"
    echo "  wtclaude --cleanup      - Remove all temporary worktrees"
    return 1
  fi

  local branch_name="$1"
  local temp_dir=$(mktemp -d -t "git-worktree-${branch_name}-XXXXXX")

  # Check if branch exists
  if git rev-parse --verify "$branch_name" >/dev/null 2>&1; then
    echo "Using existing branch '$branch_name'"
    echo "Creating worktree in $temp_dir..."
    git worktree add "$temp_dir" "$branch_name" 2>&1
  else
    echo "Creating new branch '$branch_name' from current HEAD"
    echo "Creating worktree in $temp_dir..."
    git worktree add -b "$branch_name" "$temp_dir" 2>&1
  fi

  if [ $? -eq 0 ]; then
    echo "✓ Worktree created successfully"
    cd "$temp_dir" || return 1
    claude
  else
    echo "✗ Failed to create worktree"
    rmdir "$temp_dir" 2>/dev/null
    return 1
  fi
}
