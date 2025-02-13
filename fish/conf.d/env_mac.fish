### System Paths and Core Settings ###
# XDG Base Directory
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# Homebrew
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

### Development Tools ###
# Version Managers
if status is-interactive
    pyenv init --path | source
    source (nodenv init -|psub)
end

# Language-specific settings
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x PYTHONDONTWRITEBYTECODE 1

# Compiler and toolchain
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib $LDFLAGS
set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include $CPPFLAGS

### Tool Configuration ###
# FZF
set -x FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border'
set -x FZF_LEGACY_KEYBINDINGS 0

### Path Configuration ###
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
