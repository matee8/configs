{
    config,
    lib,
    ...
}:
{
    options = {
        custom.git.name = lib.mkOption {
            type = lib.types.str;
        };
        custom.git.email = lib.mkOption {
            type = lib.types.str;
        };
    };

    config.programs.git = {
        enable = true;
        userName = config.custom.git.name;
        userEmail = config.custom.git.email;
        aliases = {
            c = "commit";
            s = "status";
            p = "push";
        };
        extraConfig = {
            credential.helper = "store";
            init.defaultBranch = "main";
            pull.rebase = false;
            ui.color.ui = "always";
            color.ui = true;
        };
    };
}
