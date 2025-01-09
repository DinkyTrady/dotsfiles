{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 3";
      dates = "weekly";
    };
    flake = "/home/kyra/newdots";
  };
  home.packages = [
    pkgs.nvd
    pkgs.nix-tree
    pkgs.nix-output-monitor
  ];
}
