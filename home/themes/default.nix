{
    lib,
    ...
}:
{
    options = {
        custom.theme = {
            font = lib.mkOption {
                type = lib.types.str;
                default = "Hack Nerd Font";
            };
            colors = {
                primary = lib.mkOption {
                    type = lib.types.str;
                    default = "f5c2e7";
                };
                secondary = lib.mkOption {
                    type = lib.types.str;
                    default = "11111b";
                };

                terminal = {
                    foreground = {
                        type = lib.types.str;
                        default = "cdd6f4";
                    };
                    background = {
                        type = lib.types.str;
                        default = "1e1e2e";
                    };

                    regular0 = {
                        type = lib.types.str;
                        default = "45475a";
                    };
                    regular1 = {
                        type = lib.types.str;
                        default = "f38ba8";
                    };
                    regular2 = {
                        type = lib.types.str;
                        default = "a6e3a1";
                    };
                    regular3 = {
                        type = lib.types.str;
                        default = "f9e2af";
                    };
                    regular4 = {
                        type = lib.types.str;
                        default = "89b4fa";
                    };
                    regular5 = {
                        type = lib.types.str;
                        default = "f5c2e7";
                    };
                    regular6 = {
                        type = lib.types.str;
                        default = "94e2d5";
                    };
                    regular7 = {
                        type = lib.types.str;
                        default = "bac2de";
                    };

                    bright0 = {
                        type = lib.types.str;
                        default = "585b70";
                    };
                    bright1 = {
                        type = lib.types.str;
                        default = "f38ba8";
                    };
                    bright2 = {
                        type = lib.types.str;
                        default = "a6e3a1";
                    };
                    bright3 = {
                        type = lib.types.str;
                        default = "f9e2af";
                    };
                    bright4 = {
                        type = lib.types.str;
                        default = "89b4fa";
                    };
                    bright5 = {
                        type = lib.types.str;
                        default = "f5c2e7";
                    };
                    bright6 = {
                        type = lib.types.str;
                        default = "94e2d5";
                    };
                    bright7 = {
                        type = lib.types.str;
                        default = "a6adc8";
                    };

                    "16" = {
                        type = lib.types.str;
                        default = "fab387";
                    };
                    "17" = {
                        type = lib.types.str;
                        default = "f5e0dc";
                    };

                    selection-foreground = {
                        type = lib.types.str;
                        default = "cdd6f4";
                    };
                    selection-background = {
                        type = lib.types.str;
                        default = "414356";
                    };

                    search-box-no-match = {
                        type = lib.types.str;
                        default = "11111b f38ba8";
                    };
                    search-box-match = {
                        type = lib.types.str;
                        default = "cdd6f4 313244";
                    };

                    jump-labels = {
                        type = lib.types.str;
                        default = "11111b fab387";
                    };
                    urls = {
                        type = lib.types.str;
                        default = "89b4fa";
                    };
                };
            };
        };
    };
}
