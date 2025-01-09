{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-emoji-wayland
    ];
  };

  xdg.configFile."rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/rofi";
    recursive = true;
  };
  xdg.configFile."rofi/config.rasi".enable = false;
}
