{
    lib,
    ...
}:
{
    imports = [
        ./audio.nix
    ];

    custom.audio.enable = lib.mkDefault false;
}
