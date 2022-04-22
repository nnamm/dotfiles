# neovim
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config

# FZF
set -x FZF_DEFAULT_OPTS "--height 50% --layout=reverse --border"

# FZF - fish plugin
set -x FZF_LEGACY_KEYBINDINGS 0

# Python
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x PYTHONDONTWRITEBYTECODE 1

# pyenv
set -x PATH $HOME/.pyenv/bin $PATH
status is-interactive; and pyenv init --path | source

# Poetry
set -x PATH $HOME/.poetry/bin $PATH

# Golang
set -x PATH $HOME/go/bin $PATH

# Rust / rust-analyzer
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.local/bin $PATH

# nodenv
set -x PATH $HOME/.nodenv/bin $PATH
status --is-interactive; and source (nodenv init -|psub)

# Deno
set -x DENO_INSTALL $HOME/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
