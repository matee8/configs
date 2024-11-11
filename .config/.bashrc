#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export TERM="xterm-256color"
export PATH="/home/mate/.path:/home/mate/.cargo/bin:/home/mate/go/bin:/home/mate/.fly/bin:/home/mate/.dotnet/tools:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export DOTNET_PATH="/usr/bin/dotnet"

source /etc/profile.d/debuginfod.sh
eval "$(zoxide init --cmd cd bash)"

bind -x '"\cs": tmux-sessionizer'
