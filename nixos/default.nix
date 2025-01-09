{ ... }:
{
  imports = [
    ./bluetooth.nix
    ./programs.nix
    ./services.nix
    ./stylix.nix
    ./packages.nix
    ./nix-settings.nix
    ./nvidia.nix
    ./zram.nix
    ./boot.nix
    ./network.nix
    ./time.nix
    ./fonts.nix
  ];
}
