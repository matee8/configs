{
    config,
    pkgs,
    ...
}:
{
    imports = [
        ./hardware-configuration.nix
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
    };

    home-manager.users.${config.custom.username} = import ./home.nix;

    system.stateVersion = "25.05";
}
