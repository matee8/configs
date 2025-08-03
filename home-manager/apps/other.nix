{
    pkgs,
    settings,
    ...
}:
{
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
    ];

    programs = {
        fastfetch.enable = true;
        zathura.enable = true;
        thunderbird = {
            enable = true;
            profiles.${settings.user.name} = {
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
}
