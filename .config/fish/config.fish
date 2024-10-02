if status is-interactive
    set -gx TERM "xterm-256color"
    set -gx PATH "/home/mate/.path:/home/mate/.cargo/bin:/home/mate/.fly/bin:$PATH"
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    # alias clear="clear && fastfetch"
    # alias startx="startx && clear"
    # clear
    alias ls="exa"
    alias learncppg++="g++ -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -ggdb -std=c++23"
    starship init fish | source
    zoxide init --cmd cd fish | source
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/mate/.ghcup/bin $PATH # ghcup-env
