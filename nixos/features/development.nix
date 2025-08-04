{
    config,
    lib,
    pkgs,
    ...
}:
{
    options = {
        custom.development.enable = lib.mkEnableOption "enable development environment";
    };

    config = lib.mkIf config.custom.development.enable {
        environment.systemPackages = with pkgs; [
            clang
            python3
        ];

        programs.neovim.enable = true;
    };
}
