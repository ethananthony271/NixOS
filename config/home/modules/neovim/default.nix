{ pkgs, lib, config, ... }:
let
  dependencies = with pkgs; [
    neovim
    python3
    luajitPackages.luarocks
    luajitPackages.jsregexp
    clang
    tree-sitter
    nodejs_22
    python312Packages.python-lsp-server
    nodePackages_latest.bash-language-server
  ];
in {
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.neovim.enable {
    #### TODO VERY IMPORTANT: make these more modular
    # imports = [ 
    #   ./git.nix
    #   ./yazi.nix
    #   ./fonts.nix
    # ];

    home.packages = dependencies;

    home.file = {
      ".config/nvim" = {
        source = ./sources;
        executable = false;
        recursive = true;
      };
    };

    xdg = { # TODO: Fix desktop entry, doesn't work
      enable = true;
      mimeApps.enable = true;
      mimeApps.defaultApplications = {
        "text/*" = ["nvim.desktop"];
      };
      desktopEntries = {
        nvim = {
          name = "Neovim";
          genericName = "Text Editor";
          exec = ''foot -e nvim %f''; # remove hardcoded foot
          # exec = "nvim %F";
          terminal = false;
          categories = [ "Utility" "TextEditor" ];
          mimeType = [ "text/english" "text/plain" "text/x-makefile" "text/x-c++hdr" "text/x-c++src" "text/x-chdr" "text/x-csrc" "text/x-java" "text/x-moc" "text/x-pascal" "text/x-tcl" "text/x-tex" "application/x-shellscript" "text/x-c" "text/x-c++" "text/x-python" ];
        };
      };
    };
  };
}
