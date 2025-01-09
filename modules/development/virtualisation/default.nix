{ pkgs, lib, ... }:
{
  # options.distrobox = {
  #   enable = lib.mkEnableOption "Enable distrobox";
  # };
  # environment.systemPackages = [ pkgs.distrobox ];
  virtualisation = {
    waydroid.enable = true;
  };
  virtualisation.podman = {
    enable = false;
    dockerCompat = true;
  };
}
