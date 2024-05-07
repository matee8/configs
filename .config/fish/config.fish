if status is-interactive
    set -gx PATH "/home/mate/.path:$PATH"
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    alias clear="clear && fastfetch"
    alias startx="startx && clear"
    clear
    starship init fish | source
    zoxide init --cmd cd fish | source
end
