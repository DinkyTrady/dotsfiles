{ config, ... }:
{
  programs.alacritty = {
    enable = true;
  };
  xdg.configFile."alacritty" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/alacritty";
    recursive = true;
  };
}
