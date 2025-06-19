{ pkgs, ... }:

let
  fetch = pkgs.fetchFromGitHub;
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = # fish
      ''
        set fish_greeting

        # enable_transience

        fish_add_path ~/DevPkg/.npm/bin
        fish_add_path ~/.bun/bin

        set -g fish_key_bindings fish_vi_key_bindings
        set fish_cursor_insert block
      '';
    plugins = [
      {
        name = "fzf";
        src = fetch {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
          sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
      {
        name = "autopair";
        src = fetch {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
          sha256 = "sha256-qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
        };
      }
      # not used sync it's making bug in NixOS
      # {
      #   name = "async";
      #   src = pkgsFetch {
      #     owner = "acomagu";
      #     repo = "fish-async-prompt";
      #     rev = "316aa03c875b58e7c7f7d3bc9a78175aa47dbaa8";
      #     sha256 = "sha256-J7y3BjqwuEH4zDQe4cWylLn+Vn2Q5pv0XwOSPwhw/Z0=";
      #   };
      # }
      {
        name = "spoonge.fish";
        src = fetch {
          owner = "meaningful-ooo";
          repo = "sponge";
          rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
          sha256 = "sha256-MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
        };
      }
    ];
  };
}
