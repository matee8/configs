{
    config,
    lib,
    pkgs,
    settings,
    ...
}:
{
    config = lib.mkIf config.custom.home-manager.desktop.enable {
        home.file.".local/share/applications/ffplay.desktop".source =
            ../../../assets/applications/ffplay.desktop;

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

        home.packages = with pkgs; [
            wl-clipboard
            wbg
            libreoffice-qt
            hunspell
            hunspellDicts.en_US
            hunspellDicts.hu_HU
            ffmpeg-full
            slurp
            grim
            atool
            zip
            unzip
            wineWowPackages.stable
            gamemode
            brightnessctl
            heroic
            glow
            qbittorrent
        ];

        programs = {
            fastfetch.enable = true;
            zathura.enable = true;
            thunderbird = {
                enable = true;
                profiles.${settings.mainUser.name} = {
                    isDefault = true;
                };
            };
            imv.enable = true;
            pandoc.enable = true;
            fzf.enable = true;
            zoxide = {
                enable = true;
                enableZshIntegration = true;
                options = [
                    "--cmd cd"
                ];
            };
        };
    };
}
