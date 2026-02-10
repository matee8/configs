# configs

Personal system-wide and user-specific configuration files for Arch Linux.

# Quick Links

- [Packages](#packages)
- [Enabled services](#enabled-services)
- [Setup commands](#setup-commands)
- [Manual setup](#manual-setup)

# Packages

## Core

| Package            | Description   |
| ------------------ | ------------- |
| linux              | Kernel        |
| linux-firmware     | Firmware      |
| amd-ucode          | CPU Microcode |
| base               | Tools         |
| base-devel         | Tools         |
| polkit             | Privileges    |
| systemd-resolvconf | resolv.conf   |
| zram-generator     | swap on zram  |

## I/O

| Package       | Description     |
| ------------- | --------------- |
| bluez         | Bluetooth       |
| bluez-utils   | Bluetooth tools |
| brightnessctl | Backlight       |
| iwd           | Network         |
| pipewire      | Multimedia      |
| wireplumber   | Multimedia util |
| sof-firmware  | Laptop audio    |
| mesa          | OpenGL          |
| lib32-mesa    | OpenGL          |
| vulkan-radeon | Vulkan          |

## Display

| Package                | Description            |
| ---------------------- | ---------------------- |
| river                  | Compositor             |
| ttf-hack-nerd          | Font                   |
| noto-fonts-emoji       | Emojis                 |
| xdg-desktop-portal     | Application sandboxing |
| xdg-desktop-portal-wlr | Portal implementation  |
| qt6-wayland            | Compatibility layer    |
| wlr-randr              | Output manager         |

## Terminal

| Package  | Description  |
| -------- | ------------ |
| foot     | Emulator     |
| tmux     | Multiplexer  |
| zsh      | Shell        |

### ZSH Plugins

- zsh-autosuggestions
- zsh-completions
- zsh-history-substring-search
- zsh-syntax-highlighting

## Applications

### Graphical

| Package                   | Description         |
| ------------------------- | ------------------- |
| firefox                   | Browser             |
| zathura                   | PDF viewer          |
| zathura-pdf-mupdf         | PDF backend         |
| imv                       | Image viewer        |
| ffmpeg                    | Media player        |
| slurp                     | Area selector       |
| steam                     | Steam               |
| prismlauncher             | Minecraft           |
| fuzzel                    | App launcher        |
| wbg                       | Background          |
| yambar                    | Status bar          |

### Console

| Package         | Description      |
| --------------- | ---------------- |
| grim            | Screenshot util  |
| wl-clipboard    | Clipboard util   |
| openssh         | SSH              |
| sshpass         | SSH passwords    |
| atool           | Archive manager  |
| unrar           | Archiver         |
| zip             | Archiver         |
| unzip           | Archiver         |
| btop            | Resource monitor |
| fzf             | Fuzzy finder     |
| zoxide          | Smarter cd       |
| pacman-contrib  | Pacman scripts   |
| pacutils        | Pacman utils     |
| reflector       | Mirror retriever |
| man-db          | Manuals          |
| man-pages       | Manuals          |
| texinfo         | Manuals          |
| xdg-user-dirs   | User directories |
| wine            | Windows layer    |
| wine-mono       | Windows layer    |
| wine-gecko      | Windows layer    |
| protontricks    | Windows layer    |
| gamemode        | Optimizations    |
| ntfs-3g         | NTFS util        |
| e2fsprogs       | ext4 util        |
| lftp            | FTP client       |
| wireguard-tools | VPN              |
| pandoc-bin      | Document conv    |
| fastfetch       | System info      |

## Development

| Package         | Description      |
| --------------- | ---------------- |
| neovim          | Editor           |
| git             | Version control  |
| valgrind        | Memory checker   |
| gdb             | Debugger         |
| perf            | Profiler         |
| scc-bin         | Code counter     |
| docker          | Containers       |
| docker-compose  | Containers       |
| aichat          | LLM client       |
| tree-sitter-cli | Treesitter       |

### C/C++

- clang

### CSS

- vscode-css-languageserver

### Database

- postgresql
- sqlite

### HTML

- vscode-html-languageserver

### Java

- jdk-openjdk

### JavaScript

- nodejs
- npm
- typescript-language-server

### LaTeX

- biber
- texlive
- texlive-langeuropean
- texlab

### Lua

- lua
- stylua

### Python

- jupyter-notebook
- python
- uv
- pyright

### Rust

- rustup

# Enabled services

- systemd-timesyncd
- iwd
- systemd-resolved
- iptables
- ip6tables
- paccache.timer
- reflector.timer
- fstrim.timer
- docker.socket

# Setup commands

```bash
ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
hwclock --systohc
locale-gen
grub-install --target i386-px /dev/nvme0n1
grub-mkconfig -o /boot/grub/grub.cfg
passwd --lock root
xdg-user-dirs-update
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mariadb-secure-installation
useradd -m -G wheel -G gamemode mate
passwd mate
ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list
go telemetry off
su postgres
initdb -D /var/lib/postgres/data
```

# Maual setup

## Firefox

- Search engines
- Extensions

## Libreoffice

Go to Tools > Options > LibreOffice > Advanced and uncheck Use a Java runtime
environment.
