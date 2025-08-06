{
    config,
    lib,
    ...
}:
let
    # There is no left shift operator in Nix.
    # 2^n is used instead.
    pow2 = n: if n == 0 then 1 else 2 * pow2 (n - 1);

    tagBindings = lib.listToAttrs (
        lib.flatten (
            lib.genList (
                i:
                let
                    key = toString (i + 1);
                    tag = toString (pow2 i);
                in

                [
                    {
                        name = "Super ${key}";
                        value = "set-focused-tags ${tag}";
                    }
                    {
                        name = "Super+Shift ${key}";
                        value = "set-view-tags ${tag}";
                    }
                ]
            ) 9
        )
    );

    allTags = toString ((pow2 32) - 1);
in
{
    config = lib.mkIf config.custom.river.enable {
        wayland.windowManager.river.settings.map.normal = tagBindings // {
            # Applications
            "Super Return" = "spawn foot";
            "Super B" = "spawn librewolf";
            "Super O" = "spawn libreoffice";
            "Super E" = "spawn thunderbird";

            # Application management
            "Super+Shift E" = "exit";
            "Super Q" = "close";

            # Window management
            "Super J" = "focus-view next";
            "Super K" = "focus-view previous";
            "Super+Shift J" = "swap next";
            "Super+Shift K" = "swap previous";
            "Super+Shift Return" = "zoom";
            "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
            "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
            "Super I" = "send-layout-cmd rivertile 'main-count +1'";
            "Super D" = "send-layout-cmd rivertile 'main-count -1'";
            "Super F" = "toggle-fullscreen";
            "Super+Shift Space" = "toggle-float";
            # Mappings for the other tags are generated automatically
            # by the let binding.
            "Super 0" = "set-focused-tag ${allTags}";

            # Control buttons
            "None Print" = "spawn 'pkill slurp || slurp | grim -g - - | wl-copy'";
            "None XF86AudioMute" = "spawn 'wpctl set-mute @DEFAULT_SINK@ toggle'";
            "None XF86AudioRaiseVolume" = "spawn 'wpctl set-volume @DEFAULT_SINK@ 5%+'";
            "None XF86AudioLowerVolume" = "spawn 'wpctl set-volume @DEFAULT_SINK@ 5%-'";
            "None XF86MonBrightnessUp" = "spawn 'brightnessctl set 5%+'";
            "None XF86MonBrightnessDown" = "spawn 'brightnessctl set 5%-'";
        };
    };
}
