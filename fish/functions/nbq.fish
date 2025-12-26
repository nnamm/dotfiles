# nb query - Search notes and select with fzf preview
# Usage: nbq <search query>
function nbq
    if test (count $argv) -eq 0
        echo "Usage: nbq <search query>"
        return 1
    end

    set -l query $argv
    set -l results (nb q $query --no-color 2>/dev/null | grep -E '^\[[0-9]+\]')

    if test -z "$results"
        echo "No results found for: $query"
        return 1
    end

    set -x _NBQ_QUERY "$query"

    set -l selected (echo "$results" | fzf --ansi \
        --preview 'note_id=$(echo {} | sed -E "s/^\[([0-9]+)\].*/\1/")
                   echo "=== Note [$note_id] ==="
                   echo ""
                   nb show "$note_id" | head -5
                   echo ""
                   echo "=== Matching lines ==="
                   echo ""
                   nb show "$note_id" | grep -i --color=always -C 2 "$_NBQ_QUERY" | head -30' \
        --preview-window=right:60%:wrap \
        --header "Search: $query")

    set -e _NBQ_QUERY

    if test -n "$selected"
        set -l note_id (echo "$selected" | sed -E 's/^\[([0-9]+)\].*/\1/')
        nb edit "$note_id"
    end
end
