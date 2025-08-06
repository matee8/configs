{
    lib,
    ...
}:
{
    imports = [
        ./hardware/wireless.nix
        ./system/locale.nix
        ./system/nix.nix
        ./services/systemd.nix
        ./user.nix

        ./hardware/audio.nix
        ./hardware/bluetooth.nix
        ./system/fonts.nix
    ];

    custom = {
        audio.enable = lib.mkDefault false;
        bluetooth.enable = lib.mkDefault false;
        fonts.enable = lib.mkDefault false;
    };
}
