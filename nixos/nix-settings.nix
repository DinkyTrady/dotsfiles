{ inputs, ... }:
{
  nix.optimise.automatic = true;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.fenix.overlays.default
    ];
  };
}
