{
    config,
    lib,
    pkgs,
    ...
}:
{
    options = {
        custom.fonts.enable = lib.mkEnableOption "enable custom fonts";
    };

    config = lib.mkIf config.custom.fonts.enable {
        fonts.packages = with pkgs; [
            noto-fonts-emoji
            nerd-fonts.hack
        ];
    };
}
