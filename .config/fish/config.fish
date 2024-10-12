if status is-interactive
    set -gx TERM "xterm-256color"
    set -gx PATH "/home/mate/.path:/home/mate/.cargo/bin:/home/mate/go/bin:/home/mate/.fly/bin:/home/mate/.dotnet/tools:$PATH"
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx DOTNET_PATH "/usr/bin/dotnet"
    alias clear="clear && fastfetch"
    alias startx="startx && clear"
    alias cppdebug="clang++ -ggdb -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23"
    alias cpprelease="clang++ -O2 -DNDEBUG -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23"
    clear
    alias ls="exa"
    starship init fish | source
    zoxide init --cmd cd fish | source
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/mate/.ghcup/bin $PATH # ghcup-env
