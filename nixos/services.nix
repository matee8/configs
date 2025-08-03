{
    settings,
    ...
}:

{
    services.logind = {
        powerKey = "suspend";
        lidSwitch = "ignore";
        lidSwitchDocked = "ignore";
        lidSwitchExternalPower = "ignore";
    };

    services.pipewire = {
        pulse.enable = true;
        enable = true;
    };
    services.libinput.enable = true;

    services.xserver.videoDrivers = [ settings.system.gpu ];

    hardware.bluetooth.enable = true;
}
