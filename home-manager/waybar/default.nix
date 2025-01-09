{ config, ... }:
{
  programs.waybar = {
    enable = true;
  };

  xdg.configFile."waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/waybar";
    recursive = true;
  };
}
