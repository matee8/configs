# configs

Personal system-wide and user-specific configuration files for Arch Linux.

# Quick Links

- [Packages](#packages)
- [Enabled services](#enabled-services)
- [Setup commands](#setup-commands)
- [Manual setup](#manual-setup)

# Packages

## Core

| Package        | Description   |
| -------------- | ------------- |
| linux          | Kernel        |
| linux-firmware | Firmware      |
| amd-ucode      | CPU Microcode |
| base           | Tools         |
| base-devel     | Tools         |
| polkit         | Privileges    |
| grub           | Bootloader    |

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
| libreoffice-fresh         | Office suite        |
| zathura                   | PDF viewer          |
| zathura-pdf-mupdf         | PDF backend         |
| imv                       | Image viewer        |
| ffmpeg                    | Media player        |
| slurp                     | Area selector       |
| heroic-games-launcher-bin | Epic Games Launcher |

### Console

| Package         | Description      |
| --------------- | ---------------- |
| grim            | Screenshot util  |
| wl-clipboard    | Clipboard util   |
| openssh         | SSH              |
| atool           | Archive manager  |
| unrar           | Archiver         |
| zip             | Archiver         |
| unzip           | Archiver         |
| btop            | Resource monitor |
| fzf             | Fuzzy finder     |
| zoxide          | Smarter cd       |
| pacman-contrib  | Pacman scripts   |
| reflector       | Mirror retriever |
| man-db          | Manuals          |
| man-pages       | Manuals          |
| xdg-user-dirs   | User directories |
| wine            | Windows layer    |
| wine-mono       | Windows layer    |
| wine-gecko      | Windows layer    |
| gamemode        | Optimizations    |
| plocate         | Locate db        |
| ntfs-3g         | NTFS util        |
| glow            | Markdown render  |

## Development

| Package         | Description      |
| --------------- | ---------------- |
| neovim          | Editor           |
| git             | Version control  |
| valgrind        | Memory checker   |
| gdb             | Debugger         |
| perf            | Profiler         |

### C/C++

- clang

### CSS

- vscode-css-languageserver

### Database

- mariadb
- postgresql
- sqlite

### FSTs

- foma (AUR)

### Go

- go
- staticcheck
- gopls

### HTML

- vscode-html-languageserver

### Java

- jdk-openjdk
- maven
- jdtls (AUR)

### JavaScript

- nodejs
- bun-bin (AUR)
- npm
- typescript-language-server

### LaTeX

- biber
- texlive
- texlab

### Lua

- lua
- stylua

### Python

- python
- uv
- pyright

### Rust

rustup

# Enabled services

- systemd-timesyncd
- iwd
- systemd-resolved
- iptables
- ip6tables
- paccache.timer
- reflector.timer
- fstrim.timer

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
