{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        auto-save = true;
        true-color = true;
        color-modes = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        lsp.display-messages = true;
      };

      language-server = {
        ts = {
          command = "typescript-language-server";
          args = [ "--stdio" ];
          language-id = "javascript";
        };
        nix = {
          command = "nil";
        };
      };

      language = [
        {
          name = "typescript";
          auto-format = true;
          language-servers = [ "ts" ];
        }
        {
          name = "javascript";
          auto-format = true;
          language-servers = [ "ts" ];
        }
        {
          name = "tsx";
          auto-format = true;
          language-servers = [ "ts" ];
        }
        {
          name = "jsx";
          auto-format = true;
          language-servers = [ "ts" ];
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nix" ];
        }
      ];
    };
  };

  home.packages = with pkgs; [
    typescript-language-server
    nodePackages.typescript
    nil
  ];
}
