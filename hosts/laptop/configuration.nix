{
    config,
    pkgs,
    home-manager,
    ...
}:
{
    imports = [
        ./hardware-configuration.nix

        ../../nixos
    ];

    boot = {
        loader.grub = {
            enable = true;
            device = "/dev/nvme0n1";
        };

        initrd.kernelModules = [ "amdgpu" ];
    };

    hardware = {
        cpu.amd.updateMicrocode = true;
        graphics.extraPackages = [ pkgs.mesa.opencl ];
        bluetooth.enable = true;
    };

    services = {
        xserver.videoDrivers = [ "amdgpu" ];

        logind = {
            powerKey = "suspend";
            lidSwitch = "ignore";
            lidSwitchDocked = "ignore";
            lidSwitchExternalPower = "ignore";
        };
    };

    networking.hostName = "matelaptop";

    custom = {
        locale = "en_US.UTF-8";
        extraLocale = "hu_HU.UTF-8";
        keyMap = "hu";
        username = "mate";
        timeZone = "Europe/Budapest";

        audio.enable = true;
        bluetooth.enable = true;
        fonts.enable = true;
        brightness.enable = true;
        graphics.enable = true;
    };

    stylix = {
        enable = true;
        autoEnable = true;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        fonts = {
            sizes = {
                desktop = 14;
                applications = 14;
                terminal = 13;
                popups = 13;
            };
            sansSerif = {
                package = pkgs.nerd-fonts.hack;
                name = "Hack Nerd Font";
            };
            serif = config.stylix.fonts.sansSerif;
            monospace = config.stylix.fonts.sansSerif;
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };

    system.stateVersion = "25.05";
}
