{ config, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  xdg.configFile."nvim" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "/data/data/com.termux.nix/files/home/newdots/dots/nvim";
  };
}
