xrandr --output eDP-1 --primary --mode 1920x1080
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Natural Scrolling Enabled" 1
feh --no-fehbg --bg-fill '/home/mate/.wallpapers/ocean.png' 
picom -b
slstatus &

exec dwm
