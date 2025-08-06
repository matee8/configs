{
    config,
    lib,
    pkgs,
    ...
}:
{
    imports = [
        ./keybindings.nix
        ./rules.nix
    ];

    options.custom.river.enable = lib.mkEnableOption "enable river configuration";

    config = lib.mkIf config.custom.river.enable {
        home.packages = with pkgs; [
            wl-clipboard
            wbg
            slurp
            grim
            brightnessctl
        ];

        home.file.".wallpaper".source = ../../../assets/images/wallpaper.png;

        wayland.windowManager.river = {
            enable = true;
            xwayland = {
                enable = false;
            };
            settings = {
                border-width = 3;
                default-layout = "rivertile";
                default-attach-mode = "below";
                focus-follows-cursor = "disabled";
                set-cursor-warp = "on-output-change";
                set-repeat = "40 300";
                keyboard-layout = "hu";
                input."type:touchpad" = {
                    natural-scroll = true;
                    tap = true;
                };
                spawn = [
                    "'rivertile -view-padding 0 -outer-padding 0 -main-ratio 0.55'"
                    "yambar"
                    "'wbg .wallpaper'"
                ];
            };
        };
    };
}
