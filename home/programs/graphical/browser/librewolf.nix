{
    pkgs,
    ...
}:
{
    options.custom.librewolf.enable = lib.mkEnableOption "enable librewolf configuration";

    config = lib.mkIf config.custom.librewolf.enable {
        xdg.mimeApps.defaultApplications = {
            "text/html" = [ "librewolf.desktop" ];
            "text/xml" = [ "librewolf.desktop" ];
            "x-scheme-handler/http" = [ "librewolf.desktop" ];
            "x-scheme-handler/https" = [ "librewolf.desktop" ];
            "x-scheme-handler/about" = [ "librewolf.desktop" ];
            "x-scheme-handler/unknown" = [ "librewolf.desktop" ];
        };

        programs.librewolf = {
            enable = true;

            policies = {
                SearchEngines = {
                    Default = "StartPage";
                };
            };

            profiles.default = {
                isDefault = true;

                search = {
                    force = true;

                    engines = {
                        "NixOptions" = {
                            urls = [
                                {
                                    template = "https://search.nixos.org/options";
                                    params = [
                                        {
                                            name = "query";
                                            value = "{searchTerms}";
                                        }
                                        {
                                            name = "channel";
                                            value = "unstable";
                                        }
                                    ];
                                }
                            ];
                            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                            definedAliases = [ "@options" ];
                        };

                        "MyNixOs (configurations overview)" = {
                            urls = [
                                {
                                    template = "https://mynixos.com/search";
                                    params = [
                                        {
                                            name = "q";
                                            value = "{searchTerms}";
                                        }
                                    ];
                                }
                            ];
                            icon = "${pkgs.fetchurl {
                                url = "https://mynixos.com/favicon-32x32.png";
                                sha256 = "2b9301ff8dfbc359dbe6793ea6fc3eaa5815e0d01256e505aebbd76a3f5e84b6";
                            }}";
                            definedAliases = [ "@mynixos" ];
                        };

                        "Nix Packages" = {
                            urls = [
                                {
                                    template = "https://search.nixos.org/packages";
                                    params = [
                                        {
                                            name = "type";
                                            value = "packages";
                                        }
                                        {
                                            name = "query";
                                            value = "{searchTerms}";
                                        }
                                    ];
                                }
                            ];

                            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                            definedAliases = [ "@np" ];
                        };

                        "Nix Wiki" = {
                            urls = [
                                {
                                    template = "https://wiki.nixos.org/w/index.php?search=asd&title=Special%3ASearch&wprov=acrw1_-1";
                                    params = [
                                        {
                                            name = "search";
                                            value = "{searchTerms}";
                                        }
                                    ];
                                }
                            ];

                            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                            definedAliases = [ "@nw" ];
                        };
                    };
                };

                settings = {
                    "network.http.referer.XOriginPolicy" = 2;
                    "identity.fxaccounts.enabled" = true;
                    "browser.sessionstore.resume_from_crash" = false;
                    "middlemouse.paste" = false;
                    "general.autoScroll" = true;
                    "dom.ipc.processCount" = 4;
                    "browser.preferences.defaultPerformanceSettings.enabled" = false;
                    "browser.fullscreen.autohide" = false;
                    "browser.toolbars.bookmarks.visibility" = "never";
                    "browser.urlbar.suggest.engines" = false;
                    "general.autoscroll" = false;
                    "extensions.autoDisableScopes" = 0;
                    "cache.memory.capacity" = 36899;
                    "browser.download.panel.shown" = true;
                    "browser.tabs.loadInBackground" = false;
                    "dom.security.https_only_mode_ever_enabled_pbm" = true;
                    "privacy.clearOnShutdown.cache" = true;
                    "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
                    "privacy.clearOnShutdown_v2.cache" = true;
                    "privacy.donottrackheader.enabled" = true;
                    "privacy.purge_trackers.date_in_cookie_database" = 0;
                };

                extensions = {
                    force = true;
                    packages = with pkgs.nur.repos.rycee.firefox-addons; [
                        bitwarden
                        ublock-origin
                        privacy-badger
                    ];
                    settings = {
                        "uBlock@raymondhill.net".settings = {
                            selectedFiltersList = [
                                "ublock-filters"
                                "ublock-badware"
                                "ublock-privacy"
                                "ublock-unbreak"
                                "ublock-quick-fixes"
                                "easylist"
                                "plowe-0"
                                "online-malicious-url-blocklist"
                            ];
                        };
                    };
                };
            };
        };
    };
}
