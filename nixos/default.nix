{
    lib,
    ...
}:
{
    imports = [
        ./audio.nix
        ./bluetooth.nix
    ];

    custom = {
        audio.enable = lib.mkDefault false;
        bluetooth.enable = lib.mkDefault false;
    };
}
