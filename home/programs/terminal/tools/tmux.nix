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
        terminal = "foot";
        mouse = true;
        clock24 = true;
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
            set -g status-right "#[fg=colour0,bg=colour1] session: #S "
            set -g status-right-length 100
            set -g window-status-current-format "#[bg=colour0,fg=colour1] #I #W "
            set -g window-status-format "#[fg=colour0,bg=colour1] #I #W "
            set -g status-style bg="colour1",fg="colour0"

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
