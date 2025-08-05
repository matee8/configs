{
    config,
    lib,
    pkgs,
    ...
}:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        mouse = true;
        clock24 = true;
        terminal = "foot";
        escapeTime = 0;
        keyMode = "vi";
        historyLimit = 10000;
        disableConfirmationPrompt = true;
        focusEvents = true;
        extraConfig = ''
            # Terminal
            set-option -sa terminal-overrides ",foot*:Tc"

            # Style
            set -g status-left ""
            set -g status-right "#[fg=#${config.theme.colors.primary},bg=#${config.theme.colors.secondary}] session: #S "
            set -g status-right-length 100
            set -g window-status-current-format "#[bg=#${config.theme.colors.primary},fg=#${config.theme.colors.secondary}] #I #W "
            set -g window-status-format "#[fg=#${config.theme.colors.primary},bg=#${config.theme.colors.secondary}] #I #W "
            set -g status-style bg="#${config.theme.colors.secondary}",fg="#${config.theme.colors.primary}"

            # Misc
            set -g renumber-windows on
            setw -g xterm-keys on
            set -sg repeat-time 600
            set -g set-clipboard on

            # Keybinds
            bind-key x kill-pane

            unbind -T copy-mode-vi Enter
            unbind -T copy-mode-vi Space

            bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
            bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
            bind-key -T copy-mode-vi Y send-keys -X copy-pipe-and-cancel "wl-paste"
        '';
    };
}
