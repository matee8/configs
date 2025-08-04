{
    pkgs,
    ...
}:
{
    boot.kernelPackages = pkgs.linuxPackages_latest;

    time.timeZone = "Europe/Budapest";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "hu";
    };

    networking = {
        networkmanager.enable = true;
        firewall.enable = true;
    };

    programs = {
        zsh = {
            enable = true;
            # Sadly `home-manager` has no option for setting the prompt.
            promptInit = ''
                NEWLINE=$'\n'
                export PROMPT="%B%F{}%F{blue}%n@%m%b %F{green}(%?) %F{magenta}%~ $NEWLINE%F{red}$ "
            '';
        };
        git.enable = true;
        tmux.enable = true;
    };

    environment.systemPackages = with pkgs; [
        gcc
        nixfmt-rfc-style
    ];
}
