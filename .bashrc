[[ $- != *i* ]] && return
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

bind -x '"\es": tmux-sessionizer'

source /etc/profile.d/debuginfod.sh

eval "$(zoxide init --cmd cd bash)"
source <(fzf --bash)
