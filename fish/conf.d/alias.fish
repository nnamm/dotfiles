### File Operations ###
# eza (modern ls) → moved to abbr in config.fish
# alias ll='eza -al'
# alias ld='eza -al -s new'
# alias lt='eza --icons -T -L 3 -al'
# alias lls='eza -al -s size'

# General → moved to abbr in config.fish
# alias cl='clear'

# OS-specific editor
switch (uname)
    case Darwin
        alias vim='nvim'
        alias view='nvim -R'
    case Linux
        alias vim='nvim.appimage'
        alias view='nvim.appimage -R'
end

### Git Commands ###
# alias g='git'
# alias ga='git add .'
# alias gb='git branch'
# alias gc='git commit -m $1'
# alias gk='git checkout -b $1'
# alias gl='git log --graph --oneline'
# alias gp='git pull'
# alias gs='git status -sb'
# alias cz="czg"     → moved to abbr in config.fish
# alias lg='lazygit' → moved to abbr in config.fish
# alias pr='cd (git rev-parse --show-toplevel)' → moved to abbr in config.fish

### Tmux Shortcuts ###
alias tm1='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session1.conf'
alias tm2='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session2.conf'
alias tm3='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session3.conf'
alias tm4='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session4.conf'

### Directory Shortcuts ###
# OS-specific directories
switch (uname)
    case Darwin
        # alias dev='cd ~/Develop'   → moved to abbr in config.fish
        # alias mdev='cd ~/Develop/Project' → moved to abbr in config.fish
        # alias cld='cd /Users/nnamm/Library/Mobile\ Documents/com~apple~CloudDocs/' → moved to abbr in config.fish
end

### Package Manager ###
# OS-specific package manager
switch (uname)
    case Darwin
        # alias bu='brew upgrade' → moved to abbr in config.fish
        # alias bc='brew cleanup' → moved to abbr in config.fish
end

### nb Commands ###
# alias nbe='nb edit $1'          → moved to abbr in config.fish
# alias nbl='nb ls --limit 20'    → moved to abbr in config.fish
# alias nbla='nb ls --all'        → moved to abbr in config.fish
# alias nbg='rg "$1" "$(nb notebooks current --path)"' → moved to fish/functions/nbg.fish
