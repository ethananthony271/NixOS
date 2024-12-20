{ lib, config, ... }: {
  options = {
    neovim.plugins.luasnip = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = config.neovim.enable;
      };
    };
  };

  config = lib.mkIf config.neovim.plugins.luasnip.enable (lib.mkMerge [
    {
      home.file = {
        ".config/nvim/snippets" = {
          source = ./sources/snippets;
          executable = false;
          recursive = true;
        };
      };

      programs.nixvim = {
        plugins.luasnip = {
          enable = true;
          fromLua = [
            { paths = "${config.xdg.configHome}/nvim/snippets"; }
          ];
          settings = {
            enable_autosnippets = true;
            update_events = [
              "TextChanged"
              "TextChangedI"
            ];
          };
        };
      };
    }
    (lib.mkIf config.neovim.plugins.cmp.enable {
      programs.nixvim = {
        plugins.cmp.settings.sources = [
          {
            name = "luasnip";
            option = { show_autosnippets = false; };
          }
        ];
      };
    })
  ]);
}
