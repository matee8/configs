# .config files

---

Operating System: Arch Linux\
Packages: 569

# Core

Kernel: linux, linux-firmware\
Service configuration and init system: systemd (base)\
Bootloader: grub\
Processor microcode: amd-ucode\
Application sandboxing: xdg-desktop-portal, xdg-desktop-portal-gtk\
Tools: base, base-devel

# I/O

Display server: xorg-server\
Bluetooth: bluez, bluez-utils\
Brightness: brightnessctl\
Network: networkmanager\
GPU driver: xf86-video-amdgpu\
OpenGL: mesa\
Vulkan: vulkan-radeon\
Multimedia processor: pipewire, wireplumber, gst-plugin-pipewire, 
pipewire-pulse\
Digital signal processor: sof-firmware\

## Xorg

xorg-xinit\
xorg-xinput\
xorg-xrandr\
xclip

# Display

Window manager: bspwm\
Hotkey daemon: sxhkd\
Compositor: picom\
Status bar: polybar\
Font: ttf-hack-nerd\
Emoji fonts: noto-fonts-emoji\
Cursor: catppuccin-cursors-mocha (AUR)\
Cursor hiding: unclutter

# Terminal

Emulator: alacritty\
Multiplexer: tmux\
Shell: zsh

## ZSH plugins

zsh-autosuggestions\
zsh-completions\
zsh-history-substring-search\
zsh-syntax-highlighting

# Apps

## GUI

Browser: firefox\
Office suite: libreoffice-fresh\
PDF viewer: mupdf\
Image viewer: feh\
Media player: ffplay\
Screenshot utility: maim

## CLI/TUI

Screen recorder: ffmpeg\
Markdown renderer: glow\
File manager: nnn\
File sync: rclone\
Remote login: openssh\
Paginator: less\
Archive manager: atool\
Archivers: unrar, zip\
Document format converter: pandoc-bin (AUR)\
System resource monitor: btop\
Fuzzy finder: fzf\
Find alternative: fd\
Search tool: ripgrep\
Smarter cd: zoxide\
Pacman scripts: pacman-contrib\
Pacman mirror retriever: reflector

# Development

Editor: neovim\
Version control: git\
Memory management checker: valgrind\
Container packer: docker\
Debugger: gdb

## C/C++

clang

## C#

dotnet-runtime\
dotnet-sdk

## Database

mariadb\
postgresql

## Go

go\
staticcheck\
pkgsite (go)

## Haskell

ghcup (official site)\
hlint (stack)\
ormolu (stack)

## JavaScript

npm\
nodejs\
eslint (npm)\
prettier (npm)\
nodemon (npm)\
bun-bir (AUR)

## PHP

php\
composer

## Python

python\
python-pylint\
yapf

## Rust

rustup
