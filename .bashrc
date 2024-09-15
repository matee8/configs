#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="/home/mate/.path:$PATH"
export VISUAL=nvim
export EDITOR=nvim
alias clear="clear && fastfetch"
alias startx="startx && clear"
source /etc/profile.d/debuginfod.sh
clear
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
