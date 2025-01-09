{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    themes = {
      catppuccin_mocha_transparent = {
        "inherits" = "catppuccin_mocha";
        "ui.background" = { };
      };
    };

    settings = {
      theme = "catppuccin_mocha_transparent";

      editor = {
        line-number = "relative";
        bufferline = "multiple";
        undercurl = true;
        color-modes = true;
        completion-trigger-len = 1;
        idle-timeout = 0;
        shell = [
          "fish"
          "-c"
        ];

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker.hidden = false;
        soft-wrap.enable = true;

        indent-guides = {
          render = true;
          character = "|";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };

    languages = {
      language = [
        # not using rust for now
        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
      ];
    };
  };
}
