{
    pkgs,
    ...
}:
{
    home.packages = with pkgs; [
        valgrind
        gdb

        clang

        nodejs
        eslint
        prettier
        nodemon

        stylua

        python3
        yapf

        rustup
    ];

    programs = {
        aichat.enable = true;
        pylint.enable = true;
        texlive.enable = true;
    };
}
