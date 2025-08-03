{
    pkgs,
    ...
}:

{
    environment.systemPackages = with pkgs; [
        gcc
        git
        neovim
        tmux
        zsh

        nixfmt-rfc-style
    ];

    fonts.packages = with pkgs; [
        noto-fonts-emoji
        nerd-fonts.hack
    ];

    programs.zsh = {
        enable = true;
        # Sadly, since `home-manager` has no option for setting the prompt,
        # this has to be done here. Ideally, it'd be moved to
        # `/home-manager/apps/zsh.nix`.
        promptInit = ''
            NEWLINE=$'\n'
            export PROMPT="%B%F{}%F{blue}%n@%m%b %F{green}(%?) %F{magenta}%~ $NEWLINE%F{red}$ "
        '';
    };
}
