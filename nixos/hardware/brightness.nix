{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.brightness.enable = lib.mkEnableOption "enable brightess configuration";

    config = lib.mkIf config.custom.brightness.enable {
        environment.systemPackages = [
            pkgs.brightnessctl
        ];
    };
}
