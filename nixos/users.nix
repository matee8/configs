{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.username = lib.mkOption {
        type = lib.types.str;
    };

    config = {
        programs.zsh = {
            enable = true;
            # Sadly `home-manager` has no option for setting the prompt.
            promptInit = ''
                NEWLINE=$'\n'
                export PROMPT="%B%F{}%F{blue}%n@%m%b %F{green}(%?) %F{magenta}%~ $NEWLINE%F{red}$ "
            '';
        };

        users = {
            defaultUserShell = pkgs.zsh;

            users.${config.custom.username} = {
                isNormalUser = true;
                extraGroups = [
                    "networkmanager"
                    "wheel"
                ];
            };
        };
    };
}
