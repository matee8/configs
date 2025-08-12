autoload -Uz compinit promptinit
promptinit
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

prompt_custom_setup() {
    PS1=$'%B%F{}%F{blue}%n@%m%b %F{green}(%?) %F{magenta}%~\n%F{red}$ '
}

prompt_themes+=( custom )

prompt custom

HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
setopt appendhistory
setopt sharehistory
unsetopt beep

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

export PATH="${PATH}:${HOME}/.local/bin"

bindkey -v
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^F" autosuggest-accept
bindkey "^[[27;5;13~" autosuggest-execute

alias ls="ls --color=auto -h"
alias grep="grep --color=auto -i"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias mkdir="mkdir -pv"
alias ping="ping -c 5"
alias rm="rm -I --preserve-root"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"
alias df="df -h"
alias du="du -shc"
alias dmesg="dmesg -HL"
export LESS='-R --use-color -Dd+r$Du+b$'

source <(fzf --zsh)
eval "$(zoxide init zsh --cmd cd)"
