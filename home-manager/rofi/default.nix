{ config, pkgs }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-emoji-wayland
      rofi-power-menu
      rofi-screenshot
    ];
  };
  xdg.configFile.rofi = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/rofi";
    recursive = true;
  };
}
