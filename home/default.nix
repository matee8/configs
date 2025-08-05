{
    config,
    ...
}:
{
    imports = [
        ./programs/git.nix
    ];

    home = {
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;
    };

    xdg.enable = true;
    programs.home-manager.enable = true;
}
