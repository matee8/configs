{
    lib,
    ...
}:
{
    imports = [
        ./audio.nix
        ./bluetooth.nix
        ./fonts.nix
        ./nix.nix
        ./users.nix
        ./misc.nix
    ];

    custom = {
        audio.enable = lib.mkDefault false;
        bluetooth.enable = lib.mkDefault false;
        fonts.enable = lib.mkDefault false;
    };
}
