{
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    extraModulePackages = [
      # pkgs.linuxKernel.packages.linux_zen.nvidiaPackages.latest
      pkgs.linuxKernel.packages.linux_zen.lenovo-legion-module
    ];
    loader = {
      systemd-boot.enable = false; # not used
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        fontSize = lib.mkForce 28;
      };
      timeout = 45;
    };
  };
}
