#!/bin/bash
# Display repository name with GitHub icon

CURRENT_DIR="$1"
repo=$(git -C "$CURRENT_DIR" rev-parse --show-toplevel 2>/dev/null)

if [ -n "$repo" ]; then
    printf "\xef\x82\x9b %s" "$(basename "$repo")"
else
    echo "-"
fi
