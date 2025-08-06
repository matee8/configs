{
    config,
    pkgs,
    ...
}:
{
    imports = [
        ../../home
    ];

    stylix = {
        enable = true;
        autoEnable = true;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        targets.librewolf = {
            profileNames = [ "default" ];
            colorTheme.enable = true;
        };

        targets.neovim.enable = false;

        fonts = {
            sizes = {
                desktop = 11;
                applications = 11;
                terminal = 13;
                popups = 13;
            };
            sansSerif = {
                package = pkgs.nerd-fonts.hack;
                name = "Hack Nerd Font";
            };
            serif = config.stylix.fonts.sansSerif;
            monospace = config.stylix.fonts.sansSerif;
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };

    custom = {
        username = "mate";
        git = {
            name = "matee8";
            email = "graves-bluff-pesky@duck.com";
        };
        librewolf.enable = true;
        river.enable = true;
        foot.enable = true;
        zathura.enable = true;
        imv.enable = true;
        ffplay.enable = true;
        thunderbird.enable = true;
        libreoffice.enable = true;
        qbittorrent.enable = true;
        heroic.enable = true;
    };

    home = {
        stateVersion = "25.05";
    };
}
