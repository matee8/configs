{
    config,
    lib,
    ...
}:
{
    imports = [
        ./programs/terminal/shells/zsh.nix
        ./programs/terminal/tools/git.nix
        ./programs/terminal/tools/tmux.nix
        ./programs/terminal/tools/zoxide.nix
        ./programs/terminal/tools/fastfetch.nix
        ./programs/terminal/tools/pandoc.nix
        ./programs/terminal/tools/fzf.nix

        ./programs/graphical/browser/librewolf.nix
        ./programs/graphical/wm/river
        ./programs/graphical/pdf/zathura.nix
        ./programs/graphical/image/imv.nix
        ./programs/graphical/video/ffplay.nix
        ./programs/graphical/email/thunderbird.nix
        ./programs/terminal/emulators/foot.nix
    ];

    options.custom.username = lib.mkOption {
        type = lib.types.str;
    };

    config = {
        custom = {
            librewolf.enable = lib.mkDefault false;
            river.enable = lib.mkDefault false;
            foot.enable = lib.mkDefault false;
            zathura.enable = lib.mkDefault false;
            imv.enable = lib.mkDefault false;
            ffplay.enable = lib.mkDefault false;
            thunderbird.enable = lib.mkDefault false;
        };

        home = {
            inherit (config.custom) username;
            homeDirectory = "/home/" + config.custom.username;
        };

        xdg.enable = true;
        programs.home-manager.enable = true;
    };
}
