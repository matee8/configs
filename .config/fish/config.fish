if status is-interactive
    set -gx PATH "/home/mate/.path:$PATH"
    set -gx EDITOR code
    set -gx VISUAL code
    set -gx MICRO_TRUECOLOR 1
    alias clear="clear && fastfetch"
    alias startx="startx && clear"
    alias xampp="sudo /opt/lampp/lampp"
    alias ls="exa"
    clear
    cd
    starship init fish | source
    zoxide init --cmd cd fish | source
end
