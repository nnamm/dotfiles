# nb add article - Add a note with article title and URL
# Usage: nba <url>              - Auto-fetch title from URL
#        nba <title> <url>      - Use specified title
function nba
    if test (count $argv) -lt 1
        echo "Usage: nba <url>           # Auto-fetch title"
        echo "       nba <title> <url>   # Manual title"
        return 1
    end

    set -l title ""
    set -l url ""

    if test (count $argv) -eq 1
        set url $argv[1]
        echo "Fetching title from: $url"

        set title (curl -sL --max-redirs 3 --max-time 5 --compressed "$url" | head -c 512 | perl -0777 -ne 'print $1 if /<title[^>]*>([^<]+)<\/title>/i')
        set title (echo "$title" | perl -pe 's/^\s+|\s+$//g; s/\s+/ /g')

        if test -z "$title"
            echo "Error: Could not fetch title from URL"
            return 1
        end
        echo "Title: $title"
    else
        set title $argv[1]
        set url $argv[2]
    end

    set -l content "# $title

参照: [$title]($url)"

    nb add --filename "Web: $title.md" --content "$content"
    echo "Note created: [$title]($url)"
end
