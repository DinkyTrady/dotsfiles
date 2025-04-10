{ lib, pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = false;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
    konsole
    okular
  ];
}
