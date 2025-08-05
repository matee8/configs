{
    lib,
    ...
}:
{
    imports = [
        ./audio.nix
        ./bluetooth.nix
        ./fonts.nix
    ];

    custom = {
        audio.enable = lib.mkDefault false;
        bluetooth.enable = lib.mkDefault false;
        fonts.enable = lib.mkDefault false;
    };
}
