# NixOS & Home-Manager Configuration

This repository contains my personal NixOS and Home-Manager configuration.
It uses Nix Flakes to declaratively manage a tailored, tiling-based Wayland
desktop environment. The setup is designed to be modular and portable across
different machines.

# Quick links

- [Overview](#overview)
- [Getting Started](#getting-started)
- [Key Features & Bindings](#key-features--bindings)
- [Code Structure](#code-structure)
- [License](#license)

# Overview

This configuration is fully managed by Nix Flakes, ensuring reproducible builds.
The structure separates system configuration (`nixos/`), user dotfiles
(`home-manager/`), and machine-specific definitions (`hosts/`). All personal
data, and theme preferences are centralized in `settings.nix` for easy
customization.

The desktop environment is built as follows:

-   **Window Manager**: River, a dynamic tiling Wayland compositor that uses a
    main-stack layout.
-   **Status Bar**: Yambar, a heavily configurable bar for Wayland. The current
    configuration provides information about workspaces, the focused 
    application, system resources, network status, audio volume, battery, and
    date/time.
-   **Terminal Emulator**: Foot, a lightweight and fast Wayland-native terminal.
-   **Shell**: Zsh, enhanced with autosuggestions, syntax highlighting, history
    substring search, and useful aliases.
-   **Web Browser**: Librewolf, a privacy-focused Firefox fork; configured with
    uBlock Origin, Privacy Badger, and Bitwarden.
-   **Text Editor**: Neovim, enabled via Nix and configured separately in Lua.
-   **Theming**: A custom dark theme with pink accents is used across all
    components. Colors and fonts are easily changed in `settings.nix`.

# Getting Started

## Prerequisites

-   A running NixOS installation.
-   Nix with Flakes enabled.

## Installation

1.  Clone the repository to your local machine.

    ```bash
    git clone <your-repo-url>
    cd <repo-name>
    ```

2.  Customize the configuration. You **must** review and edit these files:
    -   `settings.nix`: Update user details, hostnames, and theme preferences.
    -   `hosts/`: Create a new directory for your machine (e.g., `my-pc/`) or
        modify the existing `laptop/` directory. Update the hardware-specific
        options in `hosts/your-machine/home.nix` and
        `hosts/your-machine/configuration.nix`.
    -   `flake.nix`: Add an option for your host.

3.  Build and apply the configuration. From the root of the repository, run the
    following commands. Replace `yourHostName` with the one you defined in
    `settings.nix` and `yourUserName` with your username.

    First, apply the system-wide NixOS configuration:
    ```bash
    sudo nixos-rebuild switch --flake .#yourHostName
    ```

    Next, apply the user-specific Home-Manager configuration:
    ```bash
    home-manager switch --flake .#yourUserName@yourHostName
    ```

# Key Features & Bindings

This configuration is heavily reliant on keyboard shortcuts. The `Super` key
(Windows/Command key) is the primary modifier.

### Global (River WM)

| Binding                  | Action                                    |
| ------------------------ | ----------------------------------------- |
| `Super` + `Return`       | Spawn a new terminal (`foot`)             |
| `Super` + `B`            | Spawn the web browser (`librewolf`)       |
| `Super` + `Q`            | Close the focused view (window)           |
| `Super` + `Shift` + `E`  | Exit the River session                    |
| `Super` + `J` / `K`      | Focus the next/previous view              |
| `Super` + `Shift`+`J`/`K`| Swap the focused view with the next/prev  |
| `Super` + `H` / `L`      | Decrease/increase the main-ratio          |
| `Super` + `I` / `D`      | Increase/decrease the main-count          |
| `Super` + `F`            | Toggle fullscreen for the focused view    |
| `Super` + `Shift`+`Space`| Toggle floating for the focused view      |
| `Super` + `[1-9]`        | Switch to the specified tag (workspace)   |
| `Super` + `Shift`+`[1-9]`| Move the focused view to a specified tag  |
| `PrintScreen`            | Take a screenshot of a selected region    |

### System Controls

| Binding                    | Action                   |
| -------------------------- | ------------------------ |
| `XF86AudioMute`            | Toggle mute              |
| `XF86AudioRaiseVolume`     | Increase volume by 5%    |
| `XF86AudioLowerVolume`     | Decrease volume by 5%    |
| `XF86MonBrightnessUp`      | Increase screen brightness |
| `XF86MonBrightnessDown`    | Decrease screen brightness |

### System Updates

To keep the system up-to-date, update the flake's inputs and rebuild.

```bash
nix flake update
sudo nixos-rebuild switch --flake .#yourHostName
home-manager switch --flake .#yourUserName@yourHostName
```

# Code Structure

The repository is organized to separate concerns between the system, the user,
and the machine.

```
.
├── flake.nix              # Flake entry point, defines outputs.
├── flake.lock             # Pins exact versions of all inputs.
├── settings.nix           # Centralized variables for user, system, theme.
├── utils/                 # Helper functions for building configurations.
├── hosts/
│   └── laptop/            # Machine-specific configurations.
│       ├── configuration.nix      # Main NixOS config for this host.
│       ├── home.nix               # Main Home-Manager config for this host.
│       └── hardware-configuration.nix # Auto-generated hardware profile.
├── nixos/
│   ├── default.nix        # Imports all system modules.
│   ├── profiles/          # System-level profiles (console, desktop).
│   ├── features/          # Optional system-level features (development).
│   └── users.nix          # System user management module.
├── home-manager/
│   ├── default.nix        # Imports all user modules.
│   ├── apps/              # One directory per category of app configs.
│   │   ├── console/       # zsh, neovim, git, tmux configs.
│   │   └── desktop/       # river, yambar, foot, librewolf configs.
│   └── features/          # Optional user-level features.
└── assets/                # Static assets like wallpapers.
```

# License

This project is licensed under the [MIT License](LICENSE).
