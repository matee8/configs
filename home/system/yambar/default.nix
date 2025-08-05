{
    config,
    lib,
    ...
}:
{
    options = {
        custom.yambar = {
            enable = lib.mkEnableOption "enable yambar configuration";
            hardware = {
                cpuCount = lib.mkOption {
                    type = lib.types.int;
                };
                networkInterface = lib.mkOption {
                    type = lib.types.str;
                };
                batteryName = lib.mkOption {
                    type = lib.types.str;
                };
            };
        };
    };

    config = lib.mkIf config.custom.yambar.enable {
        programs.yambar = {
            enable = true;
            settings = {
                bar = {
                    height = 22;
                    spacing = 10;
                    margin = 5;
                    location = "top";
                    font = "${config.custom.theme.font}:style=Bold:size=14";
                    foreground = "${config.custom.theme.colors.terminal.foreground}FF";
                    background = "${config.custom.theme.colors.secondary}FF";
                    left = [
                        {
                            river.content.map.conditions = {
                                "~occupied".empty = { };
                                occupied = [
                                    {
                                        map.conditions = {
                                            "state == \"focused\"".string = {
                                                text = "{id}";
                                                foreground = "${config.custom.theme.colors.primary}FF";
                                                margin = 5;
                                                font = "${config.custom.theme.font}:style=Bold:size=16";
                                            };
                                            "state == \"invisible\"".string = {
                                                text = "{id}";
                                                margin = 5;
                                            };
                                            "id == \"default\"".string.text = "";
                                        };
                                    }
                                ];
                            };
                        }
                        {
                            foreign-toplevel.content.map.conditions = {
                                "~activated".empty = { };
                                activated = [
                                    {
                                        string.text = "{app-id}";
                                    }
                                ];
                            };
                        }
                    ];
                    right = [
                        {
                            cpu = {
                                poll-interval = 1000;
                                content.map.conditions = {
                                    "id == ${toString config.custom.yambar.hardware.cpuCount}" = [
                                        {
                                            string = {
                                                text = "{id}:";
                                                foreground = "${config.custom.theme.colors.primary}FF";
                                            };
                                        }
                                        {
                                            string.text = "{cpu}%";
                                        }
                                    ];
                                    "id < 0" = [
                                        {
                                            string = {
                                                text = " ";
                                                foreground = "${config.custom.theme.colors.primary}FF";
                                            };
                                        }
                                        {
                                            string.text = "{cpu}% ";
                                        }
                                    ];
                                    "id > 0" = [
                                        {
                                            string = {
                                                text = "{id}:";
                                                foreground = "${config.custom.theme.colors.primary}FF";
                                            };
                                        }
                                        {
                                            string.text = "{cpu}% ";
                                        }
                                    ];
                                };
                            };
                        }
                        {
                            mem = {
                                poll-interval = 1000;
                                content = [
                                    {
                                        string = {
                                            text = " ";
                                            foreground = "${config.custom.theme.colors.primary}FF";
                                        };
                                    }
                                    {
                                        string.text = "{used:mb} MB / {total:gb} GB ({free:gb} GB)";
                                    }
                                ];
                            };
                        }
                        {
                            network = {
                                poll-interval = 5000;
                                content.map.conditions = {
                                    "name == \"${config.custom.yambar.hardware.networkInterface}\"" = [
                                        {
                                            string = {
                                                text = "󰖩 ";
                                                foreground = "${config.custom.theme.colors.primary}FF";
                                            };
                                        }
                                        {
                                            string.text = "{state}";
                                        }
                                    ];
                                };
                            };
                        }
                        {
                            pulse.content = [
                                {
                                    string = {
                                        text = " ";
                                        foreground = "${config.custom.theme.colors.primary}FF";
                                    };
                                }
                                {
                                    map.conditions = {
                                        "~sink_muted".string.text = "{sink_percent}%";
                                        sink_muted.string.text = "mute";
                                    };
                                }
                            ];
                        }
                        {
                            battery = {
                                name = config.custom.yambar.hardware.batteryName;
                                poll-interval = 3000;
                                content = [
                                    {
                                        string = {
                                            text = " ";
                                            foreground = "${config.custom.theme.colors.primary}FF";
                                        };
                                    }
                                    {
                                        string.text = "{state} ({estimate}) {capacity}%";
                                    }
                                ];
                            };
                        }
                        {
                            clock = {
                                date-format = "%Y.%m.%d";
                                content = [
                                    {
                                        string = {
                                            text = " ";
                                            foreground = "${config.custom.theme.colors.primary}FF";
                                        };
                                    }
                                    {
                                        string.text = "{date}";
                                    }
                                ];
                            };
                        }
                        {
                            clock = {
                                date-format = "%H:%M";
                                content = [
                                    {
                                        string = {
                                            text = "󰥔 ";
                                            foreground = "${config.custom.theme.colors.primary}FF";
                                        };
                                    }
                                    {
                                        string.text = "{time}";
                                    }
                                ];
                            };
                        }
                    ];
                };
            };
        };
    };
}
