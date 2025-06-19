{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = [
    pkgs.libnotify
  ];

  services.dunst = {
    enable = false;
    iconTheme = {
      name = "Tela-Purple-Dark";
      package = pkgs.tela-icon-theme;
      size = "32x32";
    };
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
      };
    };
  };

  services.mako = {
    enable = true;
    settings = {
      defaultTimeout = "15000";
      height = "300";
      font = lib.mkForce "monospace 14";
      iconPath = "${pkgs.tela-icon-theme}/share/icons/hicolor";
    };
  };
}
