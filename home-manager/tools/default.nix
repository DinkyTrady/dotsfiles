{ config, pkgs, ... }:
{
  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "always";
      extraOptions = [
        "--group-directories-first"
      ];
    };
    fzf = {
      enable = true;
    };
    fd = {
      enable = true;
      extraOptions = [
        "--hyperlink"
      ];
      ignores = [
        ".git/"
        ".cache"
        ".config"
        ".local"
        ".nix-*"
      ];
    };
    jq.enable = true;
    ripgrep.enable = true;
    wlogout.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    hyprlock.enable = true;
  };
  home.packages = with pkgs; [
    brightnessctl
    tela-icon-theme

    # screenshot
    grimblast
  ];
}
