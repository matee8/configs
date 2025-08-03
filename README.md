# NixOS & Home-Manager Configuration

This repository contains my NixOS and Home-Manager configuration. It sets up
a personalized, tiling-based desktop environment on Wayland, tailored for my
personal workflow and thus might be opinionated and might not generalize well.

# Quick links

- [Overview](#overview)
- [Getting Started](#getting-started)
- [Key Features & Bindings](#key-features--bindings)
- [Code Structure](#code-structure)
- [License](#license)

# Overview

This NixOS configuration uses Nix Flakes to ensure that the entire system
can be reproduced and declaratively managed from a single repository.

The `settings.nix` file is used for customization of personal data, hardware
details and theme preferences.

The desktop environment is built as follows:

-   **Window Manager**: River, a dynamic tiling Wayland compositor that uses
    a main-stack layout.
-   **Status Bar**: Yambar, a heavily configurable bar for Wayland. The current
    configuration provides information about workspaces, the focused
    application, system resources, network status, audio volume, battery, and
    date/time.
-   **Terminal Emulator**: Foot, a lightweight and Wayland-native terminal.
    Themed to match the overall aesthetic.
-   **Shell**: Zsh, enhanced with autosuggestions, syntax highlighting and
    history substring search.
-   **Web Browser**: Librewolf, a privacy-focused Firefox fork; configured with
    essential extensions like a password manager and a content blocker.
-   **Text Editor**: Neovim, enabled via Nix and configured separately in Lua.
    The editor is used with a minimal configuration, and mostly uses
    native features.
-   **Theming**: Catppuccin is used across all components, however, this can
    be changed very easily in the `settings.nix` file.

The entire setup is designed to be portable by modifying the `settings.nix`
file.

# Getting Started

## Prerequisites

-   A running NixOS installation.
-   Nix with Flakes enabled. This is configured in `nixos/configuration.nix`
    but needs to be enabled in the base system first.

## Installation

1.  Clone the repository to your local machine.

    ```bash
    git clone https://github.com/matee8/config.git
    cd configs
    ```

2.  **Crucially, customize `settings.nix`**. This file contains all the personal
    and machine-specific variables. You **must** review and edit it to match
    your own setup.


3.  Build and apply the configuration. From the root of the repository, run the
    `nixos-rebuild` command. The flake output name (e.g., `matelaptop`) must
    match the `hostName` you defined in `settings.nix`.

    ```bash
    sudo nixos-rebuild switch --flake .#yourHostName
    ```

# Key Features & Bindings

This configuration is heavily reliant on keyboard shortcuts for an efficient
workflow. The `Super` key (Windows/Command key) is the primary modifier.

### Global (River WM)

| Binding                 | Action                                    |
| ----------------------- | ----------------------------------------- |
| `Super` + `Return`      | Spawn a new terminal (`foot`)             |
| `Super` + `B`           | Spawn the web browser (`librewolf`)       |
| `Super` + `Q`           | Close the focused view (window)           |
| `Super` + `Shift` + `E` | Exit the River session                    |
| `Super` + `J` / `K`     | Focus the next/previous view              |
| `Super` + `Shift`+`J`/`K`| Swap the focused view with the next/previous |
| `Super` + `H` / `L`     | Decrease/increase the main-ratio          |
| `Super` + `I` / `D`     | Increase/decrease the main-count          |
| `Super` + `F`           | Toggle fullscreen for the focused view    |
| `Super` + `Shift`+`Space`| Toggle floating for the focused view      |
| `Super` + `[1-9]`       | Switch to the specified tag (workspace)   |
| `Super` + `Shift`+`[1-9]`| Move the focused view to the specified tag |
| `PrintScreen`           | Take a screenshot of a selected region    |

### System Controls

| Binding                    | Action                   |
| -------------------------- | ------------------------ |
| `XF86AudioMute`            | Toggle mute              |
| `XF86AudioRaiseVolume`     | Increase volume by 5%    |
| `XF86AudioLowerVolume`     | Decrease volume by 5%    |
| `XF86MonBrightnessUp`      | Increase screen brightness |
| `XF86MonBrightnessDown`    | Decrease screen brightness |

### System Updates

To keep the system up-to-date, you can update the flake's inputs and rebuild.

```bash
nix flake update
sudo nixos-rebuild switch --flake .#yourHostName
```

# Code Structure

The repository is organized to separate system-level concerns from user-level
dotfiles.

```
.
├── flake.nix               # Flake entry point, defines nixos and home-manager outputs.
├── flake.lock              # Pins exact versions of all flake inputs for reproducibility.
├── settings.nix            # Centralized variables for user, system, theme, etc.
├── LICENSE                 # Project license.
├── nixos/
│   ├── configuration.nix   # Main NixOS configuration file. Imports all other system modules.
│   ├── hardware-configuration.nix # Auto-generated hardware profile.
│   ├── services.nix        # System-level services (Pipewire, Bluetooth, etc.).
│   └── system-packages.nix # System-wide packages, fonts, and Zsh prompt.
├── home-manager/
│   ├── home.nix            # Main Home-Manager entry point. Imports all user modules.
│   └── apps/               # Contains one file per application for modular configuration.
│       ├── river.nix       # River window manager and keybindings.
│       ├── yambar.nix      # Yambar status bar configuration.
│       ├── foot.nix        # Foot terminal configuration.
│       ├── zsh.nix         # Zsh plugins, aliases, and settings.
│       ├── neovim.nix      # Enables Neovim and points to its Lua config.
│       ├── nvim/           # Native Neovim configuration in Lua.
│       ├── librewolf.nix   # Librewolf settings, extensions, and search engines.
│       └── ...             # And other application configs.
└── assets/                 # Static assets like wallpapers and .desktop files.
```

# License

This project is licensed under the [MIT License](LICENSE).
