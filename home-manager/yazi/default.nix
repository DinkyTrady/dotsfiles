{ config, ... }:
{
  programs.yazi = {
    enable = true;
  };
  xdg.configFile."yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/yazi";
    recursive = true;
  };
}
