{
    pkgs,
    ...
}:
{
    imports = [
        ../../home
    ];

    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        targets.librewolf = {
            profileNames = [ "default" ];
            colorTheme.enable = true;
        };
    };

    custom = {
        username = "mate";
        librewolf.enable = true;
        river.enable = true;
        foot.enable = true;
    };

    home = {
        stateVersion = "25.05";
    };
}
