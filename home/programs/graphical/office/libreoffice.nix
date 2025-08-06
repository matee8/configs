{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.libreoffice.enable = lib.mkEnableOption "enable libreoffice configuration";

    config = lib.mkIf config.custom.zathura.enable {
        home.packages = with pkgs; [
            libreoffice-qt
            hunspell
            hunspellDicts.en_US
            hunspellDicts.hu_HU
        ];
    };
}
