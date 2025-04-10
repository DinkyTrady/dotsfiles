{
  inputs,
  ...
}:
{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
    ./home.nix
    ../../modules/users/kyra
    ../../modules/development/virtualisation
  ];

  user.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  environment.sessionVariables = {
    FLAKE = "/home/kyra/newdots";
  };

  fileSystems."/MediaDisk/windows" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

  nixpkgs.overlays = [
    inputs.fjordlauncher.overlays.default
  ];

  system.stateVersion = "24.05"; # Did you read the comment? Y
}
