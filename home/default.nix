{
    config,
    lib,
    ...
}:
{
    imports = [
        ./programs/graphical/browser/librewolf.nix
        ./programs/graphical/wm/river
    ];

    options.custom.username = lib.mkOption {
        type = lib.types.str;
    };

    config = {
        custom = {
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
