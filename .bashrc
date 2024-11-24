[[ $- != *i* ]] && return
alias grep='grep --color=auto'

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
