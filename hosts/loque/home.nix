{ inputs, config, pkgs, ... }:

{
  imports = [
    ../../config/home/default.nix
  ];

  home = {
    username = "ea";
    homeDirectory = "/home/ea";
    stateVersion = "24.05";
  };
  
  ags.enable = false;
  waybar.enable = false;

  discord.enable = true;

  gpg.enable = true;

  email = {
    enable = true;
    thunderbird.enable = true;
  };

  bookmarks.enable = true;
  beeper.enable = true;

  firefox.enable = true;
  foot.enable = true;

  gaming = {
    enable = true;
  };

  slack.enable = true;
  teams.enable = true;
  git.enable = true;
  libreoffice.enable = true;

  hypr = {
    enable = true;
    hyprpaper = {
      enable = true;
      wallpaper = ../../config/assets/mountains.png;
    };
    animations = {
      enable = true;
    };
  };

  importMusic.enable = false;

  passwords = {
    enable = true;
    keepass.enable = true;
    pass.enable = true;
  };

  music = {
    enable = true;
    mpd = {
      enable = true;
      ncmpcpp.enable = true;
    };
    importMusic.enable = true;
  };

  neovim = {
    enable = true;
    nixvim.enable = false;
    lua.enable = true;
  };

  shell = {
    enable = true;
    bash.enable = true;
    zsh.enable = true;
  };

  swayimg.enable = true;
  theme.enable = true;

  wofi = {
    enable = true;
    emoji.enable = false;
  };

  yazi.enable = true;
  zathura.enable = true;
  zellij.enable = true;

  input = {
    touchpad.enable = false;
    keyboard = {
      formFactor = "mac";
    };
  };

  monitors = {
    microstepMSI.enable = true;
    framework.enable = false;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null; # "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = null; # "${config.home.homeDirectory}/Pictures";
    publicShare = null; # "${config.home.homeDirectory}/Public";
    templates = null; # "${config.home.homeDirectory}/Templates";
    videos = null; # "${config.home.homeDirectory}/Videos";
  };

  programs.home-manager.enable = true;
}
