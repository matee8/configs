{
    pkgs,
    settings,
    ...
}:
{
    imports = [
        ./apps/git.nix
        ./apps/zsh.nix
        ./apps/tmux.nix
        ./apps/neovim.nix
        ./apps/foot.nix
        ./apps/river.nix
        ./apps/yambar.nix
        ./apps/librewolf.nix

        ./apps/dev.nix
        ./apps/other.nix
    ];

    xdg.enable = true;

    home = {
        username = settings.user.name;
        homeDirectory = "/home/" + settings.user.name;
    };

    home.file.".local/share/applications/ffplay.desktop".source =
        ../assets/applications/ffplay.desktop;

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "image/png" = "imv.desktop";
            "image/jpeg" = "imv.desktop";
            "image/gif" = "imv.desktop";
            "image/bmp" = "imv.desktop";
            "image/tiff" = "imv.desktop";
            "video/mp4" = "ffplay.desktop";
            "video/x-matroska" = "ffplay.desktop";
            "audio/mpeg" = "ffplay.desktop";
            "application/pdf" = "org.pwmt.zathura.desktop";
            "text/html" = "librewolf.desktop";
            "x-scheme-handler/http" = "librewolf.desktop";
            "x-scheme-handler/https" = "librewolf.desktop";
            "x-scheme-handler/about" = "librewolf.desktop";
            "x-scheme-handler/unknown" = "librewolf.desktop";
        };
    };

    programs.home-manager.enable = true;

    home.stateVersion = settings.system.stateVersion;
}
