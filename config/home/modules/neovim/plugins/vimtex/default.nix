{ pkgs, lib, config, ... }: {
  options = {
    neovim.plugins.vimtex = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = (config.neovim.enable && config.latex.enable);
      };
    };
  };

  config = lib.mkIf config.neovim.plugins.vimtex.enable (lib.mkMerge [
    {
      programs.nixvim = {
        plugins.vimtex = {
          enable = true;
          texlivePackage = pkgs.texliveFull;
          # settings = {
          #   fold_enabled = true;
          #   view_method = "zathura";
          #   compiler_method = "latexmk";
          #   fold_manual = true;
          #   fold_types = {
          #     preamble.enabled = true;
          #     sections.enabled = true;
          #     parts.enabled = true;
          #     comments.enabled = false;
          #     envs.whitelist = ["frame" "abstract"];
          #     env_options.enabled = false;
          #     items.enabled = false;
          #     markers.enabled = false;
          #     cmd_single.enabled = false;
          #     cmd_single_opt.enabled = false;
          #     cmd_multi.enabled = false;
          #     cmd_addplot.enabled = false;
          #   };
          #   indent_enabled = false;
          #   matchparen_enabled = false;
          #   toc_config = {
          #     split_pos = "vert topleft";
          #     split_width = 40;
          #     mode = 1;
          #     fold_enable = true;
          #     fold_level_start = -1;
          #     show_help = false;
          #     resize = false;
          #     show_numbers = true;
          #     layer_status = {
          #       label = 0;
          #       include = 0;
          #       todo = 0;
          #       content = 1;
          #     };
          #     hide_line_numbers = false;
          #     tocdepth = 2;
          #     indent_levels = 1;
          #   };
          #   toc_show_preamble = false;
          #
          #   doc_confirm_single = false;
          # };
        };
        # keymaps = [
        #   { mode = [ "n" ]; key = "<leader>vu"; action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>"; options = { noremap = true; silent = true; desc = "Toggle Undotree View"; }; }
        # ];
      };
    }
  ]);
}
