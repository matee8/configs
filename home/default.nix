{
    config,
    lib,
    ...
}:
{
    imports = [
        ./programs/git
        ./programs/foot
        ./programs/librewolf

        ./programs/zsh

        ./system/river

        ./themes
    ];

    options.custom.username = lib.mkOption {
        type = lib.types.str;
    };

    config = {
        custom = {
            foot.enable = lib.mkDefault false;
            librewolf.enable = lib.mkDefault false;
            river.enable = lib.mkDefault false;
        };

        home = {
            inherit (config.custom) username;
            homeDirectory = "/home/" + config.custom.username;
        };

        xdg.enable = true;
        programs.home-manager.enable = true;
    };
}
