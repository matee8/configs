{
    config,
    lib,
    pkgs,
    settings,
    ...
}:

{
    imports = [
        ./hardware-configuration.nix
        ./system-packages.nix
        ./services.nix
    ];

    boot = {
        loader.grub = {
            enable = true;
            device = "/dev/" + settings.system.diskName;
        };
        kernelPackages = pkgs.linuxPackages_latest;
    };

    networking = {
        hostName = settings.system.hostName;
        networkmanager.enable = true;
    };

    time.timeZone = "Europe/Budapest";

    i18n.defaultLocale = "en_US.UTF-8";

    console = {
        font = "Lat2-Terminus16";
        keyMap = "hu";
    };

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ mesa.opencl ];
    };

    users.users.${settings.user.name} = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "networkmanager"
        ];
        shell = pkgs.zsh;
    };

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    system.stateVersion = settings.system.stateVersion;
}
