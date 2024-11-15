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

alias claer="clear"
alias clear="clear && fastfetch"
alias startx="startx && clear"
alias cppdebug="clang++ -ggdb -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23"
alias cpprelease="clang++ -O2 -DNDEBUG -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++23"

bindkey -s "^[s" 'tmux-sessionizer\n'

eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"

source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

alias ls="lsd"

# haskell
[[ -z "$GHCUP_INSTALL_BASE_PREFIX" ]] && export GHCUP_INSTALL_BASE_PREFIX="$HOME"
export PATH="$HOME/.cabal/bin:/home/mate/.ghcup/bin:$PATH"


# ocaml
[[ ! -r '/home/mate/.opam/opam-init/init.zsh' ]] || source '/home/mate/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

clear

# bun completions
[ -s "/home/mate/.bun/_bun" ] && source "/home/mate/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
