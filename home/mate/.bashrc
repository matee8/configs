[[ $- != *i* ]] && return

export PS1="\[\e[1m\]\[\e[34m\]\u@\h\[\e[0m\] \[\e[32m\](\$?)\[\e[0m\] \[\e[35m\]\w\[\e[0m\]\n\[\e[31m\]\$\[\e[0m\] "
export HISTFILE="${XDG_STATE_HOME}"/bash/history

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
export LESS='-R --use-color -Dd+r$Du+b$'

bind -x '"\es": tmux-sessionizer'

source /etc/profile.d/debuginfod.sh

eval "$(zoxide init --cmd cd bash)"
source <(fzf --bash)
