{
    pkgs,
    settings,
    firefox-addons,
    ...
}:
{
    programs.librewolf = {
        enable = true;
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
        };
        policies = {
            SearchEngines = {
                Default = "StartPage";
            };
        };
        profiles.${settings.user.name} = {
            id = 0;
            name = settings.user.name;
            isDefault = true;
            settings = {
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
            search = {
                force = true;
                engines = {
                    "OpenStreetMap" = {
                        urls = [
                            {
                                template = "https://openstreetmap.org/search";
                                params = [
                                    {
                                        name = "query";
                                        value = "{searchTerms}";
                                    }
                                ];
                            }
                        ];
                        icon = "${pkgs.fetchurl {
                            url = "https://wiki.openstreetmap.org/w/images/7/79/Public-images-osm_logo.svg";
                            sha256 = "7afb5dc08cde400274e7405fda6324a6514c4f957227b659f9c8aaea4d59a899";
                        }}";
                        definedAliases = [ "@map" ];
                    };

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
                };
            };
            extensions = {
                force = true;
                packages = with firefox-addons.packages.${settings.system.arch}; [
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
}
