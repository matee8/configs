{
    settings,
    ...
}:
{
    programs.yambar = {
        enable = true;
        settings = {
            bar = {
                height = 22;
                spacing = 10;
                margin = 5;
                location = "top";
                font = "${settings.theme.font}:style=Bold:size=14";
                foreground = "${settings.theme.colors.terminal.foreground}FF";
                background = "${settings.theme.colors.secondary}FF";
                left = [
                    {
                        river.content.map.conditions = {
                            "~occupied".empty = { };
                            occupied = [
                                {
                                    map.conditions = {
                                        "state == \"focused\"".string = {
                                            text = "{id}";
                                            foreground = "${settings.theme.colors.main}FF";
                                            margin = 5;
                                            font = "${settings.theme.font}:style=Bold:size=16";
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
                                "id == ${toString settings.system.cpuCount}" = [
                                    {
                                        string = {
                                            text = "{id}:";
                                            foreground = "${settings.theme.colors.main}FF";
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
                                            foreground = "${settings.theme.colors.main}FF";
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
                                            foreground = "${settings.theme.colors.main}FF";
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
                                        foreground = "${settings.theme.colors.main}FF";
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
                                "name == \"${settings.system.networkInterface}\"" = [
                                    {
                                        string = {
                                            text = "󰖩 ";
                                            foreground = "${settings.theme.colors.main}FF";
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
                                    foreground = "${settings.theme.colors.main}FF";
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
                            name = settings.system.batteryName;
                            poll-interval = 3000;
                            content = [
                                {
                                    string = {
                                        text = " ";
                                        foreground = "${settings.theme.colors.main}FF";
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
                                        foreground = "${settings.theme.colors.main}FF";
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
                                        foreground = "${settings.theme.colors.main}FF";
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
}
