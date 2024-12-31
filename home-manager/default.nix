{ config, pkgs }:

{
  imports = [
    ../modules/desktops/wm
    ../modules/development/languages
    ./alacritty
    ./rofi
    ./obs-studio
    ./nh
    ./starship
    ./tools
    ./tmux
    ./waybar
    ./netbeans
    ./jetbrains
    ./btop
    ./neovim
    ./fish
    ./git
    ./foot
    ./yazi
  ];
  home = {
    username = "kyra";
    homeDirectory = "/home/kyra";
    stateVersion = "24.11";
    file = {
      ".npmrc".source = ../../dots/npmrc;
      ".nix-channels".source = ../../dots/nix-channels;
      ".cache/jdtls/config/config.ini".source =
        "${pkgs.jdt-language-server}/share/java/jdtls/config_linux/config.ini";
      "flake.nix".source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/flake.nix";
    };
    packages = with pkgs; [
      satty
    ];
    sessionVariables = {
      # TERM = "xterm-256color";
      EDITOR = "nvim";
      JAVA_HOME = "${pkgs.temurin-bin}";
      LOMBOK = "${pkgs.lombok}";
      JDTLS = "${pkgs.jdt-language-server}";
    };
  };
  programs.home-manager.enable = true;
}
