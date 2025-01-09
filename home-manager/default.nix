{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # window manager
    ../modules/desktops/wm

    # GUI apps
    ./desktops-apps/jetbrains
    ./desktops-apps/netbeans
    ./desktops-apps/obs-studio
    ./desktops-apps/pavucontrol.nix

    ./alacritty
    ./foot
    ./kitty
    ./ghostty
    # ./wezterm

    ./neovim
    ./helix

    ./rofi
    ./nh
    ./starship
    ./tools
    ./tmux
    ./waybar
    ./btop
    ./fish
    ./git
    ./yazi
    ./mpv

    ./notifier
  ];
  home = {
    username = "kyra";
    homeDirectory = "/home/kyra";
    stateVersion = "24.11";
    file = {
      ".npmrc".source = ../dots/npmrc;
      ".nix-channels".source = ../dots/nix-channels;
      ".cache/jdtls/config/config.ini".source =
        "${pkgs.jdt-language-server}/share/java/jdtls/config_linux/config.ini";
    };
    packages = with pkgs; [
      satty

      # browser
      microsoft-edge

      # chatters
      vesktop

      # show image
      ueberzugpp
      ffmpeg
      ffmpegthumbnailer

      #hmm
      poppler

      # sound
      alsa-utils

      # displays
      nwg-displays

      # clipboad
      wl-clipboard-rs

      # zoom-us
      # ghostty
      # ghostty
      # inputs.ghostty.packages.${pkgs.system}.default
    ];
    sessionVariables = {
      # TERM = "xterm-256color";
      EDITOR = "nvim";
      JAVA_HOME = "${pkgs.temurin-bin}";
      LOMBOK = "${pkgs.lombok}";
      JDTLS = "${pkgs.jdt-language-server}";
      RUSTUP_HOME = "/home/kyra/DevPkg/.rustup";
      CARGO_HOME = "/home/kyra/DevPkg/.cargo";
    };
  };
  programs.home-manager.enable = true;
}
