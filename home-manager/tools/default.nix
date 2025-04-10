{
  config,
  home-manager,
  pkgs,
  ...
}:
{
  programs = {
    cmus.enable = true;
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "always";
      extraOptions = [
        "--group-directories-first"
      ];
    };
    fzf.enable = true;
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
    ncmpcpp = {
      enable = true;
      package = (pkgs.ncmpcpp.override { visualizerSupport = true; });
      bindings = [
        {
          key = "j";
          command = "scroll_down";
        }
        {
          key = "k";
          command = "scroll_up";
        }
        {
          key = "J";
          command = [
            "select_item"
            "scroll_down"
          ];
        }
        {
          key = "K";
          command = [
            "select_item"
            "scroll_up"
          ];
        }
      ];
      mpdMusicDir = "~/Music";
    };
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

    mpd
  ];
  services.mpd = {
    enable = true;
    musicDirectory = "${config.xdg.userDirs.music}";
  };
}
