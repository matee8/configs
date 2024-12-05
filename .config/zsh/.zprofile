export PATH="/home/mate/.local/share/cargo/bin:/home/mate/.local/share/dotnet/tools:/home/mate/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_PATH="/usr/bin/dotnet"
NEWLINE=$'\n'
export PROMPT="%F{blue}%n@%m %F{magenta}%~${NEWLINE}%F{red}$ "
export XDG_DATA_HOME="${HOME}"/.local/share
export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_STATE_HOME="${HOME}"/.local/state
export XDG_CACHE_HOME="${HOME}"/.cache
export HISTFILE="$XDG_STATE_HOME"/zsh/history

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

export PYTHONSTARTUP="$HOME"/python/pythonrc

export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

export _ZO_DATA_DIR="$XDG_DATA_HOME"/zoxide

export MYSQL_HISTFILE="$XDG_STATE_HOME"/mariadb/.mariadb_history

export SSH_HOME="$XDG_CONFIG_HOME"/ssh
export SSH_CONFIG="$XDG_CONFIG_HOME"/ssh/config

export XDG_CURRENT_DESKTOP=river
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export GTK_USE_PORTAL=1
