setxkbmap hu
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Natural Scrolling Enabled" 1
xrandr --output eDP-1 --auto --primary
xrdb ~/.Xresources
sxhkd &
picom -b
pipewire-pulse &
polybar -q &
feh --no-fehbg --bg-fill /home/mate/Pictures/Wallpapers/ocean.png

exec bspwm
