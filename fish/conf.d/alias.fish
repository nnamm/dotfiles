### File Operations ###
# eza (modern ls)
alias ll='eza -al'
alias ld='eza -al -s new'
alias lt='eza --icons -T -L 3 -al'
alias lls='eza -al -s size'

# General
alias cl='clear'

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
alias cz="czg"
alias lg='lazygit'
alias pr='cd (git rev-parse --show-toplevel)'

### Tmux Shortcuts ###
alias tm1='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session1.conf'
alias tm2='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session2.conf'
alias tm3='tmux new-session\; source-file ~/dotfiles/tmux/.tmux.session3.conf'

### Directory Shortcuts ###
# OS-specific directories
switch (uname)
    case Darwin
        alias dev='cd ~/Develop'
        alias mdev='cd ~/Develop/Project'
        alias cld='cd /Users/nnamm/Library/Mobile\ Documents/com~apple~CloudDocs/'
end

### Package Manager ###
# OS-specific package manager
switch (uname)
    case Darwin
        alias bu='brew upgrade'
        alias bc='brew cleanup'
end

### nb Commands ###
alias nbe='nb edit $1'
alias nbl='nb ls --limit 20'
alias nbla='nb ls --all'
alias nbg='rg "$1" "$(nb notebooks current --path)"'
