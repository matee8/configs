{
    config,
    lib,
    ...
}:
{
    imports = [
        ./profiles/console.nix
        ./profiles/desktop.nix
        ./users.nix

        ./features/development.nix
    ];

    config = {
        nix.settings.experimental-features = [
            "nix-command"
            "flakes"
        ];
    };
}
