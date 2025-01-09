{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./termux.nix

    ../../home-manager/git
    ../../home-manager/helix
    ../../home-manager/btop
    ../../home-manager/tmux
    ../../home-manager/fish

    ./programs/neovim
    ./programs/yazi
    ./programs/tools
  ];
  home = {
    packages = with pkgs; [
      # tools
      ueberzugpp
      ffmpeg
      ffmpegthumbnailer

      # c
      gcc
      clang-tools

      # lua
      lua-language-server
      stylua

      # nix
      nixfmt
      nil
      nixd

      # script shell
      bash-language-server
      shellcheck
      shfmt

      # javascript
      typescript
      typescript-language-server
      nodejs
      eslint

      # java
      (jdt-language-server.override { jdk = temurin-bin; })
      (lombok.override { jdk = temurin-bin; })
      temurin-bin

      # web
      vscode-langservers-extracted
      nodePackages.prettier
    ];
    file = {
      ".npmrc".source = ../dots/npmrc;
      ".nix-channels".source = ../dots/nix-channels;
      ".cache/jdtls/config/config.ini".source =
        "${pkgs.jdt-language-server}/share/java/jdtls/config_linux/config.ini";
    };
    sessionVariables = {
      # TERM = "xterm-256color";
      EDITOR = "nvim";
      JAVA_HOME = "${pkgs.temurin-bin}";
      LOMBOK = "${pkgs.lombok}";
      JDTLS = "${pkgs.jdt-language-server}";
      RUSTUP_HOME = "/home/kyra/DevPkg/.rustup";
      CARGO_HOME = "/home/kyra/DevPkg/.cargo";
    };
    stateVersion = "24.11";
  };
}
