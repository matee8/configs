xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Natural Scrolling Enabled" 1
xrandr --output eDP-1 --primary --mode 1920x1080

exec bspwm
