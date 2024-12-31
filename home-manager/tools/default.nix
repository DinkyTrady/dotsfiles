{ config }:
{
  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "always";
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
    wlogout.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    jq.enable = true;
  };
}
