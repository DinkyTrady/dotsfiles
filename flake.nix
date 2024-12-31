{
  description = "Nix config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Not used since i don't know how to overlay it
    # hyprpanel = {
    #   url = "github:Jas-SinghFSU/HyprPanel";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # will use soon "maybe"
    # catppuccin-nix = {
    #   url = "github:catppuccin/nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackagages.${system};
    in
    {
      nixosConfigurations = {
        shizuka = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/shizuka/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
