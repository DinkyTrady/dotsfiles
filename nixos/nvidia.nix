{ config, lib, ... }:
{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
      gsp.enable = true;

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
