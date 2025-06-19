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
    # ./desktops-apps/firefox
    ./desktops-apps/jetbrains
    # ./desktops-apps/netbeans
    ./desktops-apps/obs-studio
    ./desktops-apps/pavucontrol.nix
    ./desktops-apps/waydroid
    ./desktops-apps/zoom.nix

    ## Games
    # ./desktops-apps/minecraf

    ## Terminal
    ./alacritty
    ./kitty

    ## code editor
    ./neovim
    ./helix

    ./direnv

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
      inputs.zen-browser.packages."${system}".default

      # Editing
      # kdePackages.kdenlive
      # gimp3
      inkscape

      # chatters
      vesktop

      # show image
      ueberzugpp
      ffmpeg
      ffmpegthumbnailer

      #hmm
      poppler
      obsidian

      # sound
      alsa-utils

      # displays
      # nwg-displays

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
      BUN_INSTALL_CACHE_DIR = "/home/kyra/DevPkg/.bun";
    };
  };
  programs.home-manager.enable = true;
}
