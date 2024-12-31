{ config }:
{
  programs.alacritty = {
    enable = false;
  };
  xdg.configFile.alacritty = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/alacritty";
    recurisve = true;
  };
}
