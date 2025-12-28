if status is-interactive
    # ---------- CLIS ----------
    # cat → bat (syntax highlighting)
    if type -q bat
        function cat --wraps bat
            bat --paging=never $argv
        end
    else if type -q batcat
        # Ubuntu's bat package uses 'batcat' command
        function cat --wraps batcat
            batcat --paging=never $argv
        end
        function bat --wraps batcat
            batcat --paging=never $argv
        end
    end

    # ls → eza (icons + git status)
    if type -q eza
        function ls --wraps eza
            eza --icons --group-directories-first $argv
        end
    end

    # find → fd (modern file finder)
    if type -q fd
        function find --wraps fd
            fd $argv
        end
    else if type -q fdfind
        # Ubuntu's fd-find package uses 'fdfind' command
        function find --wraps fdfind
            fdfind $argv
        end
        function fd --wraps fdfind
            fdfind $argv
        end
    end

    # grep → ripgrep (faster + smarter)
    if type -q rg
        function grep --wraps rg
            rg $argv
        end
    end

    # cd → z (frecency-based nabigation)
    if type -q zoxide
        zoxide init fish --cmd z | source
    end

    # ---------- PROMPT ----------
    if type -q starship
        starship init fish | source
    end

    # ---------- COMMANDS ----------
    # gqh + fzf interactive
    function ghq-fzf -d "Select repository with fzf"
        # Detect which bat command is available (batcat for Ubuntu, bat for others)
        set -l bat_cmd (command -v bat || command -v batcat || echo "cat")
        set -l src (ghq list | fzf --height 50% --preview "$bat_cmd --color=always --line-range :80 (ghq root)/{}/README.*")
        if test -n "$src"
            cd (ghq root)/$src
            commandline -f execute
        end
    end
    # Bind ctrl+g to ghq-fzf function
    bind \cg ghq-fzf

    # ---------- ABBREVIATIONS ----------
    abbr -a g git
    abbr -a ga "git add"
    abbr -a gb "git branch"
    abbr -a gc "git commit -m"
    abbr -a gck "git checkout"
    abbr -a gd "git diff"
    abbr -a gp "git push"
    abbr -a gl "git pull"
    abbr -a gs "git status -sb"
    abbr -a glg "git log --oneline --graph"
    # abbr -a cz czg
    # abbr -a lg lagygit
    # abbr -a pr "cd (git rev-parse --show-toplevel)"

    abbr -a d docker
    abbr -a dc docker-compose
    abbr -a dcu "docker-compose up -d"
    abbr -a dcd "docker-compose down"
    abbr -a dps "docker ps"
end
