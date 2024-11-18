# Packages (683)
## Core
Compositor: sway\
Layout manager: autotiling\
Font: ttf-hack-nerd\
Menu: bemenu\
Status: i3status\
Screenshot: slurp, grim\
Clipboard: wl-clipboard\
Wallpaper: swaybg
## IO settings
Processor: amd-ucode\
Display: brightnessctl\
Bluetooth: bluez, bluez-utils\
## Terminal
Shell: zsh\
Terminal: foot\
Fuzzy finder: fzf\
Terminal multiplexer: tmux
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
Virtualization: docker
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
nodejs\
eslint (npm)\
prettier (npm)\
bun (official site)
#### PHP
php\
composer
#### Rust
rustup
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
Image viewer: \
SSH: openssh
## Other stuff
Chatting: discord\
Gaming: lutris\
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
discord: login, font size\
firefox: login, customize toolbar, login to every site\
libreoffice-fresh: disable tips, icons: colibre dark, scheme: dark\
wine: wine mono
