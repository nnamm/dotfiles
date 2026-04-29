# nb grep - Search notes with ripgrep
# Usage: nbg <pattern> [rg options]
function nbg -d "Search notes with ripgrep"
    if test (count $argv) -eq 0
        echo "Usage: nbg <pattern>"
        return 1
    end
    rg $argv (nb notebooks current --path)
end
