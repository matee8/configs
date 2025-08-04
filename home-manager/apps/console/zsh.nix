{
    config,
    lib,
    ...
}:
{
    config = lib.mkIf config.custom.home-manager.console.enable {
        # Prompt is set in `/nixos/system-packages.nix` because home-manager
        # has no option for it.
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            historySubstringSearch.enable = true;
            shellAliases = {
                claer = "clear";
                ls = "ls --color=auto -h";
                grep = "grep --color=auto -i";
                diff = "diff --color=auto";
                ip = "ip -color=auto";
                mkdir = "mkdir -pv";
                ping = "ping -c 5";
                rm = "rm -I --preserve-root";
                mv = "mv -i";
                cp = "cp -i";
                ln = "ln -i";
                chown = "chown --preserve-root";
                chmod = "chmod --preserve-root";
                chgrp = "chgrp --preserve-root";
                df = "df -h";
                du = "du -shc";
            };
            history = {
                size = 10000;
                save = 10000;
                ignoreAllDups = true;
                path = "${config.xdg.stateHome}/zsh/history";
                append = true;
            };
            dotDir = "${config.xdg.configHome}/zsh";
            initContent = ''
                bindkey "^[[A" history-substring-search-up
                bindkey "^[[B" history-substring-search-down
                bindkey "^[[H" beginning-of-line
                bindkey "^[[F" end-of-line
                bindkey "^[[3~" delete-char
                bindkey "^[[1;5D" backward-word
                bindkey "^[[1;5C" forward-word
                bindkey "^F" autosuggest-accept
            '';
            completionInit = ''
                compinit -d ${config.xdg.cacheHome}/zsh/zcompdump-"$ZSH_VERSION"
            '';
        };
    };
}
