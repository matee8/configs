# Packages (789)
## Core
Window manager: i3-wm\
Server: xorg-server\
Init: xorg-xinit\
Layout manager: i3-autolayout (AUR)\
Compositor: picom\
Launcher: dmenu\
Status bar: polybar\
Notifications: dunst\
Screenshot: maim\
Font: ttf-hack-nerd\
Clipboard: xclip
## IO settings
Processor: intel-ucode\
Graphics card: nvidia, nvidia-settings\
Display: xorg-xrandr, brightnessctl\
Bluetooth: bluez, bluez-utils\
Volume: pulsemixer\
Mouse: xorg-xinput
## Terminal
Shell: fish\
Terminal: alacritty\
Fetch: fastfetch\
Prompt: starship\
Task manager: btop\
Fuzzy finder: fzf, ripgrep\
Smarter cd command: zoxide
## Development
Editor: neovim\
Version control: git\
Memory checker: valgrind
### Tools
#### Server, database
apache\
mariadb\
phpmyadmin\
mysql-workbench\
oracle-instantclient-basic (AUR)\
oracle-instantclient-sqlplus (AUR)
#### Network
packettracer (AUR)
#### C
cmake
#### C#
dotnet-runtime\
dotnet-sdk\
unityhub (AUR)
#### Go
go
#### JavaScript
npm\
nvm (AUR)\
typescript\
nodejs
#### PHP
php\
php-apache\
phpactor (AUR)
#### Rust
rustup
#### Zig
zig
#### Java
jdk-openjdk
#### Python
python
## Apps
Browser: firefox\
Office suite: libreoffice-fresh\
Archives: atool, unzip, zip, unrar\
Torrent: qbittorrent\
Calculator: speedcrunch\
PDF viewer: zathura, zathura-pdf-mupdf\
Audio editor: audacity\
Image viewer: feh\
Image editor: gimp\
Video player: vlc\
Video recorder: obs-studio\
Video editor: shotcut\
SSH: openssh\
VPN: openvpn\
Cloud sync: rclone
## Other stuff
Music: cider (AUR)\
Chatting: discord\
Gaming: steam\
Emoji font: noto-fonts-emoji\
Icons: papirus-icon-theme\
Compatibility: wine\
Mount helper: fuse3, ntfs-3g\
Pacman utilities: pacman-contrib\
Pacman mirror helper: reflector
# Manual setup  
## Commands
sudo grub-mkconfig -o /boot/grub/grub.cfg\
mkinitcpio -P linux\
chsh -s /bin/fish\
echo "set -U fish_greeting" | fish\
mkdir ~/.aur\
mkdir ~/Downloads\
mkdir ~/Documents\
mkdir ~/Projects\
mkdir ~/Pictures\
mkdir ~/University\
mkdir ~/Videos\
mkdir ~/Work\
mkdir ~/.path\
sudo chmod 557 /srv/http\
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql\
sudo systemctl start mariadb.service\
sudo mariadb -u root -p\
sudo mariadb-secure-installation\
mkdir /srv/http/Webprog-2\
ln -s /srv/http/ ~/Projects/PHP\
ln -s /src/http/Webprog-2 ~/University/Maskodik-felev/Webprog-2\
sudo systemctl enable paccache.timer\
sudo systemctl enable reflector.timer\
## Apps
cider: login, set theme\
discord: login, font size\
firefox: login, customize toolbar, login to every site\
git: user.name, user.email, credential.helper\
libreoffice-fresh: disable tips, icons: colibre dark, scheme: dark\
neovim: codeium\
packettracer: download, login\
rclone: config\
speedcrunch: zoom\
steam: login\
unityhub: install latest unity version\
wine: wine mono\
