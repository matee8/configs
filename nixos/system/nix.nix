{
    ...
}:
{
    nix = {
        settings = {
            auto-optimise-store = true;
            use-xdg-base-directories = true;
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
