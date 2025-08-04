{
    config,
    lib,
    pkgs,
    ...
}:
{
    options = {
        custom.desktop.enable = lib.mkEnableOption "enable desktop configuration";
    };

    config = lib.mkIf config.custom.desktop.enable {
        fonts.packages = with pkgs; [
            noto-fonts-emoji
            nerd-fonts.hack
        ];

        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };

        services = {
            pipewire = {
                pulse.enable = true;
                enable = true;
            };
            libinput.enable = true;
        };
    };
}
