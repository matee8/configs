HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$XDG_STATE_HOME"/zsh/history
setopt extendedglob
setopt appendhistory
setopt sharehistory
unsetopt beep
bindkey -e

zstyle :compinstall filename "/home/mate/.config/zsh/.zshrc"

autoload -Uz compinit
compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

source ~/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

NEWLINE=$'\n'
export PROMPT="%B%F{}%F{blue}%n@%m%b %F{green}(%?) %F{magenta}%~ ${NEWLINE}%F{red}$ "
export PATH="$PATH:$HOME/.local/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore-vcs -g "!{.git}"'

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey -s "^[s" 'tmux_sessionizer\n'

alias claer="clear"
alias ls="ls --color=auto -h"
alias grep="grep --color=auto -i"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
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
export LESS='-R --use-color -Dd+r$Du+b$'

eval "$(zoxide init zsh --cmd cd)"
source <(fzf --zsh)
