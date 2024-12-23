{ lib, config, ... }: {
  options = {
    bookmarks = {
      enable = lib.mkEnableOption "enables bookmarks";
    };
  };

  config = lib.mkIf config.bookmarks.enable (lib.mkMerge [
    {
      home = {
        file = {
          ".bookmarks/sources" = {
            source = ./sources;
            executable = true;
            recursive = true;
          };
        };
        sessionVariables = {
          BOOKMARKS = /home/ea/.bookmarks;
        };
      };
    }
    
    (lib.mkIf config.hyprland.enable {
      wayland.windowManager.hyprland.settings = {
        bindd = [
          "$mod, m, Open Bookmark, exec, $BOOKMARKS/sources/openBookmark.sh"
          "$mod SHIFT, m, Add Bookmark, exec, $BOOKMARKS/sources/addBookmark.sh"
        ];
      };
    })
  ]);
}
