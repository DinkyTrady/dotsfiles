{ pkgs, lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      # enable32Bit = true;
    };

    nvidia = {
      open = true;
      package = pkgs.linuxPackages_zen.nvidiaPackages.latest;

      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  specialisation = {
    maxPerform.configuration = {
      hardware.nvidia.prime = {
        sync.enable = lib.mkForce true;

        offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };
}
