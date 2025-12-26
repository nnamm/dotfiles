#!/bin/bash
# Display git branch with icon and status indicators

CURRENT_DIR="$1"

# Check if we're in a git repository
if ! git -C "$CURRENT_DIR" rev-parse --git-dir > /dev/null 2>&1; then
    echo "-"
    exit 0
fi

# Get branch name
branch=$(git -C "$CURRENT_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null)

if [ -z "$branch" ]; then
    echo "-"
    exit 0
fi

# Output branch name with icon (without status indicators)
printf "\xee\x9c\xa5 %s" "$branch"
