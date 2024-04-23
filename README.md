# Preview  
<img src="./assets/preview.png"> </img>
# Packages (790)  
## Core  
Window Manager: i3-wm  
Server: xorg-server  
Init: xorg-xinit  
Compositor: picom-ftlabs-git (AUR)  
Layout: i3-layouts (AUR)  
Launcher: rofi  
Status bar: polybar  
Wallpaper: feh  
Screenshot: maim  
Notifications: dunst  
## IO settings  
Processor: intel-ucode  
Display: xorg-xrandr, brightnessctl  
Graphics card: nvidia, nvidia-utils, nvidia-settings  
Bluetooth: bluez, bluez-utils  
Volume: pulsemixer  
Mouse: xorg-xinput  
## Terminal  
Shell: fish  
Terminal: alacritty  
Fetch: fastfetch  
Prompt: starship  
Task manager: btop  
Clipboard: xclip  
Font: ttf-hack-nerd  
Version control: git  
ls replacament: exa  
cd helper: zoxide  
Fuzzy finder: fzf  
## Development  
Editor: neovim  
Search tool: ripgrep  
Package manager: npm  
Network: packettracer (AUR)  
Database planning: mysql-workbench  
Game development: unityhub (AUR)  
### Tools  
cmake  
valgrind  
dotnet-runtime  
dotnet-sdk  
jdk-openjdk  
php  
apache  
php-apache  
mariadb  
phpmyadmin  
rustup  
go  
## Apps  
Explorer: ranger  
Archived files: atool, unzip, zip, unrar  
Syntax highlighting in ranger: highlight  
Image previews in ranger: w3m  
Browser: firefox  
Chatting: discord  
Office suite: libreoffice-fresh  
Image viewer: feh  
Image editor: gimp  
Media player: vlc  
Video recorder: obs-studio  
Video editor: shotcut  
Audio editor: audacity  
Torrent: qbittorrent  
PDF reader: zathura, zathura-pdf-mupdf  
Calculator: speedcrunch  
Cloud sync: rclone  
VPN: openvpn  
SSH: openssh  
## Other stuff 
Mount helpers: fuse3, ntfs-3g  
Compatibility: wine  
Emoji font: noto-fonts-emoji  
Icons: papirus-icon-theme  
Gaming: steam  
Music: cider (AUR)   
Custom discord: vencord (Official site, not as a package)  
Pacman utilities: pacman-contrib  
Pacman mirror helper: reflector  
# Manual setup  
## Commands
sudo grub-mkconfig -o /boot/grub/grub.cfg  
mkinitcpio -P linux  
chsh -s /bin/fish  
echo "set -U fish_greeting" | fish  
mkdir ~/.aur  
mkdir ~/Downloads  
mkdir ~/Documents  
mkdir ~/Projects  
mkdir ~/Pictures
mkdir ~/University  
mkdir ~/Videos  
mkdir ~/Work  
mkdir ~/.path  
sudo chmod 557 /srv/http  
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql  
sudo systemctl start mariadb.service  
sudo mariadb -u root -p  
sudo mariadb-secure-installation  
mkdir /srv/http/Webprog-2  
ln -s /srv/http/ ~/Projects/PHP  
ln -s /src/http/Webprog-2 ~/University/Maskodik-felev/Webprog-2  
sudo systemctl enable paccache.timer  
sudo systemctl enable reflector.timer  
## Apps
cider: login, set theme  
discord: login, font size  
firefox: login, customize toolbar, login to every site  
git: user.name, user.email, credential.helper  
libreoffice-fresh: disable tips, icons: colibre dark, scheme: dark  
neovim: codeium  
packettracer: download, login  
rclone: config  
speedcrunch: zoom  
steam: login  
unityhub: install latest unity version  
wine: wine mono  
## Other
Remove unused .desktop files from /usr/share/applications and rename some  
