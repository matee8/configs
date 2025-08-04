{
    settings,
    ...
}:
{
    home = {
        username = settings.mainUser.name;
        homeDirectory = "/home/" + settings.mainUser.name;
    };

    programs.git = {
        userName = settings.mainUser.git.name;
        userEmail = settings.mainUser.git.email;
    };

    custom.home-manager = {
        desktop.enable = true;
        hardware = {
            touchpadName = "pointer-1267-12608-ELAN0001:00_04F3:3140_Touchpad";
            cpuCount = 5;
            networkInterface = "wlp1s0";
            batteryName = "BAT0";
        };
        development.enable = true;
    };

    home.stateVersion = "25.05";
}
