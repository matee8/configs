{
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
        audio.enable = true;
        bluetooth.enable = true;
        fonts.enable = true;
    };

    system.stateVersion = "25.05";
}
