{ pkgs, lib, inputs, config, ... }:
let
  dependencies = with pkgs; [
    wl-clip-persist
    wl-clipboard
  ];
in {
  options = { };

  config = lib.mkIf config.hypr.enable {
    wayland.windowManager.hyprland = {
      settings = { # TODO: Make modular with which applications to launch
        "exec-once" = [
          "mako"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "wl-clip-persist --clipboard regular"

          "[workspace 1 silent] foot -e ncmpcpp"
          "[workspace 2 silent] firefox"
          "[workspace 9 silent] thunderbird"
          "[workspace 10 silent] keepassxc"
        ];
      };
    };
  };
}
