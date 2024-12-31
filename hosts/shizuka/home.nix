{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  home-manager = {
    users.kyra = ../../home-manager;
    extraSpecialArgs = {
      inherit inputs;
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
      }
    ];
  };
}
