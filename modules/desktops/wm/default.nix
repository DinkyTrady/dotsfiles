{ pkgs, ... }:

{
  wayland.windowManager = {
    hyprland = import ./hyprland { inherit pkgs; };
  };
}
