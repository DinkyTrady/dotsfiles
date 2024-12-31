{ config, pkgs }:
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
