{ config, ... }:
{
  programs.foot = {
    enable = true;
  };
  xdg.configFile."foot" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/foot";
    recursive = true;
  };
}
