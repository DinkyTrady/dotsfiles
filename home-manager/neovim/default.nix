{
  config,
  lib,
  pkgs,
  ...
}:

let
  fromRemote =
    remo: repo: ref: rev:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://${remo}/${repo}";
        ref = ref;
        rev = rev;
      };
    };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  xdg.configFile.neovim = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/nvim";
    target = "nvim";
  };
  xdg.configFile."neovim/parser" =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths =
          (pkgs.vimPlugins.nvim-treesitter.withPlugins (
            plugins: with plugins; [
              bash
              c
              cpp
              diff
              html
              hyprlang
              java
              javascript
              # javascriptreact
              # javascript.jsx
              jsdoc
              json
              json5
              jsonc
              lua
              luadoc
              luap
              markdown
              # markdown-toc
              markdown_inline
              # markdownlint-cli2
              nix
              printf
              python
              query
              regex
              rasi
              rust
              sql
              toml
              tsx
              typescript
              # typescriptreact
              # typescript.tsx
              vim
              vimdoc
              xml
              yaml
              git_config
              gitcommit
              git_rebase
              gitignore
              gitattributes
            ]
          )).dependencies;
      };
    in
    {
      enable = true;
      source = "${parsers}/parser";
    };
}
