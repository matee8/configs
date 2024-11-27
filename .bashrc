[[ $- != *i* ]] && return
alias grep='grep --color=auto'

export XDG_DATA_HOME="${HOME}"/.local/share
export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_STATE_HOME="${HOME}"/.local/state
export XDG_CACHE_HOME="${HOME}"/.cache

export HISTFILE="${XDG_STATE_HOME}"/bash/history

export PATH="/home/mate/.path:/home/mate/.cargo/bin:/home/mate/go/bin:/home/mate/.fly/bin:/home/mate/.dotnet/tools:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_PATH="/usr/bin/dotnet"
export PS1='\[\033[01;34m\]\u@\h \[\033[00;35m\]\W\n\[\033[01;31m\]\$ \[\033[00m\]'

alias claer="clear"

source /etc/profile.d/debuginfod.sh
eval "$(zoxide init --cmd cd bash)"
source <(fzf --bash)

bind -x '"\es": tmux-sessionizer'


# haskell
if [[ -z "$GHCUP_INSTALL_BASE_PREFIX" ]]; then
    export GHCUP_INSTALL_BASE_PREFIX="$HOME"
fi
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# ocaml
if [[ -r "/home/mate/.opam/opam-init/init.zsh" ]]; then
    source "/home/mate/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
fi

# bun
# if [[ -s "$HOME/.bun/_bun" ]]; then
#     source "$HOME/.bun/_bun"
# fi

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet

export GHCUP_USE_XDG_DIRS=true

export GOPATH="$XDG_DATA_HOME"/go

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

export PYTHONSTARTUP="$HOME"/python/pythonrc

export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

export STACK_ROOT="$XDG_DATA_HOME"/stack

export STACK_XDG=1
