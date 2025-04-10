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
    withPython3 = false;
    withRuby = false;
  };
  xdg.configFile."nvim" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/nvim";
  };
}
