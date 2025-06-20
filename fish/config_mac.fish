if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    # gqh + fzf interactive
    function ghq-fzf
        set -l src (ghq list | fzf --height 50% --preview "bat --color=always --line-range :80 (ghq root)/{}/README.*")
        if test -n "$src"
            cd (ghq root)/$src
            commandline -f execute
        end
    end
    # Bind ctrl+g to ghq-fzf function
    bind \cg ghq-fzf
end
