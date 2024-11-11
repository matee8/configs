# Packages (773)
## Core
Window manager: i3-wm\
Server: xorg-server\
Init: xorg-xinit\
Layout manager: i3-autolayout (AUR)\
Compositor: picom\
Launcher: dmenu\
Status bar: polybar\
Screenshot: maim\
Font: ttf-hack-nerd\
Clipboard: xclip\
Terminal multiplexer: tmux
## IO settings
Processor: amd-ucode\
Display: xorg-xrandr, brightnessctl\
Bluetooth: bluez, bluez-utils\
Volume: pulsemixer\
Mouse: xorg-xinput
## Terminal
Shell: zsh\
Terminal: alacritty\
Prompt: starship\
Fuzzy finder: fzf\
cd: zoxide\
grep: ripgrep\
## Development
Editor: neovim\
Paginator: less\
Version control: git\
Memory checker: valgrind\
Virtualization: docker\
Portability: mingw, mingw-w64-configure (AUR), mingw-w64-environment (AUR),
mingw-w64-gcc, mingw-w64-pkg-config (AUR)
### Tools
#### Database
mariadb\
postgresql
#### C
clang\
gdb
#### C#
dotnet-runtime\
dotnet-sdk\
csharpier (dotnet)
#### Go
go\
staticcheck (go)\
pkgsite (go)
#### JavaScript
npm\
nvm (AUR)\
nodejs\
eslint (npm)\
prettier (npm)
#### PHP
php\
composer
#### Rust
rustup
#### Java
jdk-openjdk\
maven
#### Python
python\
python-pylint\
yapf
#### Ocaml
opam
#### Haskell
ghcup (official site)\
hlint (cabal)\
ormolu (cabal)
## Apps
Browser: firefox\
Office suite: libreoffice-fresh\
Archives: atool, zip, unrar\
Torrent: qbittorrent\
PDF viewer: zathura, zathura-pdf-mupdf\
Image viewer: feh\
Image editor: gimp\
Video recorder: obs-studio\
SSH: openssh\
VPN: openvpn\
Cloud sync: rclone
## Other stuff
Music: apple-music-bin (AUR)\
Chatting: discord\
Gaming: steam, lutris\
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
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql\
sudo systemctl start mariadb.service\
sudo mariadb -u root -p\
sudo mariadb-secure-installation\
sudo systemctl enable paccache.timer\
sudo systemctl enable reflector.timer
## Apps
apple-music-bin: login\
discord: login, font size\
firefox: login, customize toolbar, login to every site\
libreoffice-fresh: disable tips, icons: colibre dark, scheme: dark\
rclone: config\
steam: login\
wine: wine mono
