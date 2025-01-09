{
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  home-manager = {
    useGlobalPkgs = true;
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
        stylix.targets.alacritty.enable = false;
        stylix.targets.foot.enable = false;
        stylix.targets.neovim.enable = false;
        stylix.targets.helix.enable = false;
        stylix.targets.kitty.enable = false;
        # stylix.targets.rofi.enable = false;
        stylix.targets.wezterm.enable = false;
        stylix.targets.waybar.enable = false;
        stylix.targets.yazi.enable = false;
      }
    ];
  };
}
