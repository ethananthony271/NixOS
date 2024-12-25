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
  
  ##--- Hardware ---##
  input = {
    touchpad.enable = true;
    keyboard = {
      formFactor = "mac";
    };
  };
  monitors = {
    microstepMSI.enable = true;
    framework.enable = false;
  };

  ##--- Hyprland ---##
  hyprland.enable = true;
  dunst.enable = true;
  waybar.enable = true;
  waycorner.enable = true;
  wlogout.enable = true;

  ##--- Applications ---###
  beeper.enable = true;
  discord.enable = true;
  firefox.enable = true;
  foot.enable = true;
  libreoffice.enable = true;
  mpv.enable = true;
  nautilus.enable = false;
  slack.enable = true;
  swayimg.enable = true;
  teams.enable = true;
  zathura.enable = true;
  zoom.enable = true;

  ##--- Scripting Modules ---##
  bookmarks.enable = true;
  school.enable = true;

  ##--- Other ---##
  gpg.enable = true;
  latex.enable = true;
  email = {
    enable = true;
    thunderbird.enable = true;
  };
  gaming.enable = true;
  git.enable = true;
  passwords.enable = true;
  music.enable = true;
  neovim = {
    enable = true;
    plugins = {
      telescope.enable = true;
      fzf-lua.enable = false;
    };
  };
  shell.enable = true;
  theme.enable = true;
  yazi.enable = true;
  zellij.enable = true;

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
