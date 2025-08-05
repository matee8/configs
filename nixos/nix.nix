{
    ...
}:
{
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
        gc = {
            automatic = true;
            persistent = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };
}
