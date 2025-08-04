{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.users = lib.mkOption {
        type = lib.types.attrsOf (
            lib.types.submodule {
                options = {
                    settings = lib.mkOption {
                        default = { };
                        example = {
                            shell = pkgs.bash;
                        };
                    };
                    sudo = lib.mkEnableOption "enable sudo privilage";
                };
            }
        );
    };

    config = {
        users.users = builtins.mapAttrs (
            name: user:
            {
                isNormalUser = true;
                initialPassword = "12345";
                extraGroups = [
                    "networkmanager"
                    (lib.mkIf user.sudo "wheel")
                ];
                shell = pkgs.zsh;
            }
            // user.settings
        ) (config.custom.users);
    };
}
