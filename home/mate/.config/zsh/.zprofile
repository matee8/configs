if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    export XDG_CURRENT_DESKTOP="river:wlroots"
    export QT_QPA_PLATFORM=wayland
    export SDL_VIDEODRIVER=wayland
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1
fi
