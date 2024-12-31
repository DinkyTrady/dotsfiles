{ pkgs }:
{
  environtment.SystemPackages = with pkgs; [
    killall
    pciutils

    wget

    noto-fonts-cjk

    lenovo-legion

    stow
  ];
}
