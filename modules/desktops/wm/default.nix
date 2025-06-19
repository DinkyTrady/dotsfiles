{ pkgs, ... }:

{
  wayland.windowManager = {
    hyprland = import ./hyprland { inherit pkgs; };
    sway = import ./sway { inherit pkgs; };
    # niri = import ./niri { inherit pkgs; };
  };
  services.hyprpaper.settings = {
    preload = [ "/home/kyra/newdots/dots/Wallpaper/wanella.jpg" ];
    Wallpaper = [
      "eDP-1, /home/kyra/newdots/dots/Wallpaper/wanella.jpg"
    ];
  };
}
