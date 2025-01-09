{ inputs, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  programs.nix-ld.enable = true;
}
