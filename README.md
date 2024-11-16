# Packages (755)
## Core
Window manager: dwm (official repo)\
Server: xorg-server\
Init: xorg-xinit\
Launcher: dmenu (official repo)\
Status: slstatus (official repo)\
Compositor: picom\
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
Terminal: st (official repo)\
Fuzzy finder: fzf
### Modern Unix
cd: zoxide\
grep: ripgrep\
find: fd\
top: btop
### ZSH plugins
zsh-autosuggestions\
zhs-completions\
zhs-history-substring-search\
zhs-syntax-highlighting
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
prettier (npm)\
bun (official site)
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
SSH: openssh
## Other stuff
Music: apple-music-bin (AUR)\
Chatting: discord\
Gaming: steam, lutris\
Emoji font: noto-fonts-emoji\
Compatibility: wine\
Pacman utilities: pacman-contrib\
Pacman mirror helper: reflector
# Manual setup  
## Commands
sudo grub-mkconfig -o /boot/grub/grub.cfg\
mkinitcpio -P linux\
chsh -s /bin/zsh\
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
