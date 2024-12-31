{ }:
{
  nix.optimise.automatic = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
}
