{
  pkgs,
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

  system.stateVersion = "24.05"; # Did you read the comment? Y
}
