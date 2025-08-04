{
    config,
    lib,
    pkgs,
    ...
}:
{
    options = {
        custom.home-manager.development.enable = lib.mkEnableOption "enable development configuration";
    };

    config = lib.mkIf config.custom.home-manager.development.enable {
        home.packages = with pkgs; [
            valgrind
            gdb

            clang

            vscode-langservers-extracted

            nodejs
            eslint
            prettier
            nodemon
            typescript-language-server

            stylua

            python3
            yapf
            pyright

            rustup
        ];

        programs = {
            aichat.enable = true;
            pylint.enable = true;
            texlive.enable = true;
        };
    };
}
