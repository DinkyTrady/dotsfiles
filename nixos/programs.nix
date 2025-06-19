{ inputs, pkgs, ... }:
{
  programs = {
    fish.enable = true;
    nix-ld = {
      enable = true;
      libraries = [
        pkgs.gccStdenv
        pkgs.clangStdenv
      ];
    };
    niri.enable = true;

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    # virt-manager.enable = true;
  };

  security.polkit.enable = true;
}
