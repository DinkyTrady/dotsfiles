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
  ];

  user.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "kyra" = import ./home.nix;
    };
    sharedModules = [
      {
        nixpkgs.overlays = [
          inputs.hyprpanel.overlay
        ];
      }
      {
        stylix.targets.neovim.enable = false;
        stylix.targets.foot.enable = false;
        stylix.targets.alacritty.enable = false;
      }
    ];
  };

  system.stateVersion = "24.11"; # Did you read the comment? Y
}
