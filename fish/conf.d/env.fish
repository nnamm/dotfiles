### System Paths and Core Settings ###
# XDG Base Directory
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# OS-specific system settings
switch (uname)
    case Darwin
        # Homebrew
        if test -x /opt/homebrew/bin/brew
            eval (/opt/homebrew/bin/brew shellenv)
        end
    case Linux
        # WSL/Ubuntu specific settings can go here if needed
end

### Development Tools ###
# pyenv/nodenv
fish_add_path $HOME/.pyenv/bin
fish_add_path $HOME/.nodenv/bin
if status is-interactive
    pyenv init --path | source
    source (nodenv init - | psub)
end
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x PYTHONDONTWRITEBYTECODE 1

# OS-specific compiler settings
switch (uname)
    case Darwin
        # Compiler and toolchain
        set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib $LDFLAGS
        set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include $CPPFLAGS
end

### Tool Configuration ###
# FZF
set -x FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border --preview "bat --color=always --line-range :80 {}"'
# FZF - fish plugin
set -x FZF_LEGACY_KEYBINDINGS 0

### Path Configuration ###
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/opt/llvm/bin
        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/go/bin
        fish_add_path $HOME/.local/bin
    case Linux
        fish_add_path /usr/local/go/bin
        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/go/bin
        fish_add_path $HOME/.local/bin
end
