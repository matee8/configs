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

        ./themes
    ];

    custom = {
        foot.enable = lib.mkDefault false;
        librewolf.enable = lib.mkDefault false;
    };

    home = {
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;
    };

    xdg.enable = true;
    programs.home-manager.enable = true;
}
