{ config, ... }:
{
  programs.yazi = {
    enable = true;
  };
  xdg.configFile."yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "/data/data/com.termux.nix/files/home/newdots/dots/yazi";
    recursive = true;
  };
}
