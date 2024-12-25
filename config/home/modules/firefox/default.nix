{ pkgs, lib, inputs, config, ... }:
let
  profileName = "ea";
  dependencies = [ ];
  extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
    youtube-shorts-block
    ublock-origin
    sponsorblock
    firefox-color
    new-tab-override
  ];
  searchEngines = {
    "Startpage" = {
      urls = [ { template = "https://www.startpage.com/rd/search?query={searchTerms}&language=auto"; } ];
      definedAliases = [ "@s" ];
    };
    "Nix Packages" = {
      urls = [{
        template = "https://search.nixos.org/packages";
        params = [
          { name = "type"; value = "packages"; }
          { name = "query"; value = "{searchTerms}"; }
        ];
      }];
      icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = [ "@np" ];
    };
    "NixOS Wiki" = {
      urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}&go=Go"; }];
      icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = [ "@nw" ];
    };
    "NixOS Discourse" = {
      urls = [{ template = "https://discourse.nixos.org/search?q={searchTerms}"; }];
      icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = [ "@nd" ];
    };
    "My NixOS" = {
      urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
      icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = [ "@nm" ];
    };
    "GitHub" = {
      urls = [{ template = "https://github.com/search?q={searchTerms}&type=repositories"; }];
      iconupdateurl = "https://upload.wikimedia.org/wikipedia/commons/9/95/Font_Awesome_5_brands_github.svg";
      updateinterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = [ "@gh" ];
    };
    "My DU" = {
      urls = [{ template = "https://my.du.edu/search/{searchTerms}#all"; }];
      iconupdateurl = "https://upload.wikimedia.org/wikipedia/commons/3/33/Denver_Pioneers_Athletics_logo.svg";
      updateinterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = [ "@du" ];
    };
    "Arch Wiki" = {
      urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}&title=Special%3ASearch&wprov=acrw1_-1"; }];
      iconupdateurl = "https://upload.wikimedia.org/wikipedia/commons/1/13/Arch_Linux_%22Crystal%22_icon.svg";
      updateinterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = [ "@aw" ];
    };
    "Wikimedia Commons" = {
      urls = [{ template = "https://commons.wikimedia.org/w/index.php?search={searchTerms}&title=Special:MediaSearch&go=Go&type=image"; }];
      iconupdateurl = "https://upload.wikimedia.org/wikipedia/commons/4/41/Commons-logo-en.svg";
      updateinterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = [ "@wc" ];
    };
    "Wikipedia" = {
      urls = [{ template = "https://en.wikipedia.org/wiki/Special:Search?go=Go&search={searchTerms}&ns0=1"; }];
      iconupdateurl = "https://upload.wikimedia.org/wikipedia/commons/f/f6/Wikipedia-logo-v2-wordmark.svg";
      updateinterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = [ "@wp" ];
    };

    "Amazon.com".metaData.hidden = true;
    "Bing".metaData.hidden = true;
    "DuckDuckGo".metaData.hidden = true;
    "eBay".metaData.hidden = true;
    "google".metaData.hidden = true;
    "Google".metaData.hidden = true;
    "Wikipedia (en)".metaData.hidden = true;
  };
  defaultSettings = {
    # Disable irritating first-run stuff
    "browser.disableResetPrompt" = true;
    "browser.download.panel.shown" = true;
    "browser.feeds.showFirstRunUI" = false;
    "browser.messaging-system.whatsNewPanel.enabled" = false;
    "browser.rights.3.shown" = true;
    "browser.shell.checkDefaultBrowser" = false;
    "browser.shell.defaultBrowserCheckCount" = 1;
    "browser.startup.homepage_override.mstone" = "ignore";
    "browser.uitour.enabled" = false;
    "startup.homepage_override_url" = "";
    "trailhead.firstrun.didSeeAboutWelcome" = true;
    "browser.bookmarks.restore_default_bookmarks" = false;
    "browser.bookmarks.addedImportButton" = true;

    # UI Options
    "browser.compactmode.show" = true;
    "browser.uidensity" = 1;
    "browser.tabs.tabmanager.enabled" = false;
    "browser.fullscreen.autohide" = false;
    "browser.toolbars.bookmarks.visibility" = "never";
    "sidebar.position_start" = false;

    # Prevent window from closing when last tab is closed
    "browser.tabs.closeWindowWithLastTab" = false;

    # Remove unwanted features
    "extensions.pocket.enabled" = false; # pocket
    "identity.fxaccounts.enabled" = false; # firefox sync
    "browser.tabs.firefox-view" = false; # tab overview
    "signon.rememberSignons" = false; # asking to save passwords

    # Auto-enable extensions
    "extensions.autoDisableScopes" = 0;
    "extensions.enabledScopes" = 15;

    # Miscellaneous options
    "general.autoScroll" = true; # Enable autoscrolling
    "browser.aboutConfig.showWarning" = false; # Prevent about:config warning
  };
in {
  imports = [
    inputs.textfox.homeManagerModules.default
  ];

  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable (lib.mkMerge [
    {
      home = {
        packages = dependencies;
        file = {
          ".mozilla/startpage" = {
            source = ./sources/startpage;
            executable = false;
            recursive = true;
          };
        };
      };

      textfox = {
        enable = true;
        profile = "${profileName}";
        config = {
          displayHorizontalTabs = false;
          displayNavButtons = true;
        };
      };

      programs.firefox = {
        enable = true;
        profiles = {
          "${profileName}" = {
            name = "Ethan Anthony";
            isDefault = true;
            extensions = extensions;
            search = {
              force = true;
              default = "Startpage";
              engines = searchEngines;
              order = [
                "Startpage"
                "Nix Packages"
                "NixOS Wiki"
                "NixOS Discourse"
                "My NixOS"
                "GitHub"
                "My DU"
                "Arch Wiki"
                "Wikimedia Commons"
                "Wikipedia"
              ];
            };
            settings = defaultSettings;
          };
        };
      };

      xdg = {
        enable = true;
        mimeApps.enable = true;
        mimeApps.defaultApplications = {
          "text/html" = ["firefox.desktop"];
          "text/xml" = ["firefox.desktop"];
          "x-scheme-handler/http" = ["firefox.desktop"];
          "x-scheme-handler/https" = ["firefox.desktop"];
        };
      };
    }
    (lib.mkIf config.yazi.enable {
      programs.yazi.settings.opener = {
        pdf = [
          { run = ''firefox "$@"''; orphan = true; desc = "󰈹 Firefox"; }
        ];
        image = [
          { run = ''firefox "$@"''; orphan = true; desc = "󰈹 Firefox"; }
        ];
        office = [
          { run = ''firefox "$@"''; orphan = true; desc = "󰈹 Firefox"; }
        ];
      };
    })
    (lib.mkIf (config.hyprland.windowRules.enable == true) {
      wayland.windowManager.hyprland.settings.windowrulev2 = [
        "float,class:firefox,title:Picture-in-Picture"
        "size 50% 50%,class:firefox,title:Picture-in-Picture"
        "move 25% 25%,class:firefox,title:Picture-in-Picture"
      ];
    })
  ]);
}
