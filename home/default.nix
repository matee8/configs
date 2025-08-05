{
    config,
    lib,
    ...
}:
{
    imports = [
        ./programs/git.nix
        ./programs/foot.nix

        ./themes
    ];

    custom.foot.enable = lib.mkDefault false;

    home = {
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;
    };

    xdg.enable = true;
    programs.home-manager.enable = true;
}
