{ pkgs, ... }:
{
  imports = [
    ../modules/development/languages
  ];
  environment.systemPackages = with pkgs; [
    killall
    pciutils

    wget

    lenovo-legion

    stow
  ];
}
