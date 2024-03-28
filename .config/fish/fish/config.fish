if status is-interactive
    export PATH="/home/mate/.path:$PATH"
    alias clear="clear && fastfetch"
    alias startx="startx && clear"
    alias xampp="sudo /opt/lampp/lampp"
    alias ls="exa"
    clear
    cd
    starship init fish | source
end
