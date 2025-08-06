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
        username = "mate";
        timeZone = "Europe/Budapest";

        audio.enable = true;
        bluetooth.enable = true;
        fonts.enable = true;
        brightness.enable = true;
    };

    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    };

    system.stateVersion = "25.05";
}
