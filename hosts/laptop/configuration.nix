{
    pkgs,
    settings,
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

    networking.hostName = settings.hostnames.laptop;

    custom = {
        users.${settings.mainUser.name}.sudo = true;
        development.enable = true;
        desktop.enable = true;
    };

    system.stateVersion = "25.05";
}
