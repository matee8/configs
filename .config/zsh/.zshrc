HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -e

zstyle :compinstall filename "/home/mate/.zshrc"

autoload -Uz compinit
compinit

source ~/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/home/mate/.path:/home/mate/.cargo/bin:/home/mate/go/bin:/home/mate/.fly/bin:/home/mate/.dotnet/tools:/home/mate/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_PATH="/usr/bin/dotnet"
NEWLINE=$'\n'
export PROMPT="%F{blue}%n@%m %F{magenta}%~${NEWLINE}%F{red}$ "
export XDG_DATA_HOME="${HOME}"/.local/share
export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_STATE_HOME="${HOME}"/.local/state
export XDG_CACHE_HOME="${HOME}"/.cache
export HISTFILE="$XDG_STATE_HOME"/zsh/history

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

alias claer="clear"
alias ls="ls --color=auto -h"
alias grep="grep --color=auto -i"
alias mkdir="mkdir -pv"
alias ping="ping -c 5"
alias rm="rm -I --preserve-root"
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias df="df -h"
alias du="du -shc"
jd()
{
    dir=$(fd --max-depth 3 --min-depth 1 --type d '' ~/Work/2024 ~/Projects ~/ ~/University/Harmadik-felev/ | fzf)
    if [[ -n $dir ]]; then
        cd "$(dirname $dir)" || return
    else
        echo "No selection made" >&2
    fi
}

bindkey -s "^[s" 'tmux_sessionizer\n'

eval "$(zoxide init zsh --cmd cd)"

export BEMENU_BACKEND="wayland"

n()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

alias nnn="n -exoQ"
alias n="n -exoQ"

source <(fzf --zsh)

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# haskell
[[ -z "$GHCUP_INSTALL_BASE_PREFIX" ]] && export GHCUP_INSTALL_BASE_PREFIX="$HOME"
export PATH="$HOME/cabal/bin:/home/mate/.ghcup/bin:$PATH"
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal

# bun completions
[ -s "/home/mate/.bun/_bun" ] && source "/home/mate/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet

export GHCUP_USE_XDG_DIRS=true

export GOPATH="$XDG_DATA_HOME"/go

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

export PYTHONSTARTUP="$HOME"/python/pythonrc

export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

export STACK_ROOT="$XDG_DATA_HOME"/stack

export STACK_XDG=1

export _ZO_DATA_DIR="$XDG_DATA_HOME"/zoxide

export MYSQL_HISTFILE="$XDG_STATE_HOME"/mariadb/.mariadb_history

export SSH_HOME="$XDG_CONFIG_HOME"/ssh
export SSH_CONFIG="$XDG_CONFIG_HOME"/ssh/config
