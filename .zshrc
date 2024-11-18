HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -e

zstyle :compinstall filename "/home/mate/.zshrc"

autoload -Uz compinit
compinit

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/home/mate/.path:/home/mate/.cargo/bin:/home/mate/go/bin:/home/mate/.fly/bin:/home/mate/.dotnet/tools:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_PATH="/usr/bin/dotnet"
NEWLINE=$'\n'
export PROMPT="%F{blue}%n@%m %F{magenta}%~${NEWLINE}%F{red}$ "
export BEMENU_BACKEND="wayland"

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
alias df="df -H"
alias di="du -shc"

bindkey -s "^[s" 'tmux-sessionizer\n'

eval "$(zoxide init zsh --cmd cd)"

source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# haskell
[[ -z "$GHCUP_INSTALL_BASE_PREFIX" ]] && export GHCUP_INSTALL_BASE_PREFIX="$HOME"
export PATH="$HOME/.cabal/bin:/home/mate/.ghcup/bin:$PATH"


# ocaml
[[ ! -r '/home/mate/.opam/opam-init/init.zsh' ]] || source '/home/mate/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# bun completions
[ -s "/home/mate/.bun/_bun" ] && source "/home/mate/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
