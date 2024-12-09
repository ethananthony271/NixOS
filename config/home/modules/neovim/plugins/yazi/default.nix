{ pkgs, lib, config, ... }:
let
  dependencies = with pkgs; [ ];
in {
  options = {
    neovim.plugins.yazi.enable = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = config.neovim.enable;
      };
    };
  };

  config = lib.mkIf config.shell.programs.cosmetics.enable {
    programs.nixvim = {
      plugins.yazi.enable = true;
      keymaps = [
        { mode = [ "n" ]; key = "<leader>be"; action = "<cmd>Yazi<CR>"; options = { noremap = true; silent = true; desc = "Open Yazi"; }; }
      ];
    };
  };
}
