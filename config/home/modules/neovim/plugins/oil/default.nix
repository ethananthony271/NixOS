{ lib, config, ... }: {
  options = {
    neovim.plugins.oil = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = config.neovim.enable;
      };
    };
  };

  config = lib.mkIf config.neovim.plugins.oil.enable (lib.mkMerge [
    {
      programs.nixvim = {
        plugins.oil = {
          enable = true;
          settings = {
            default_file_explorer = true;
            delete_to_trash = true;
          };
        };
        keymaps = [
          { mode = [ "n" ]; key = "<leader>fo"; action = "<cmd>Oil<CR>"; options = { noremap = true; silent = true; desc = "Open Oil"; }; }
        ];
      };
    }
  ]);
}