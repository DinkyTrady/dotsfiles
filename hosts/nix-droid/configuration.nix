{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../nixos/time.nix
  ];

  user.shell = "${pkgs.fish}/bin/fish";

  # default packages
  environment.packages = with pkgs; [
    # Some common stuff that people expect to have
    #procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  environment.etcBackupExtension = ".bak";

  # System version
  system.stateVersion = "24.05";

  # enable flakes
  nix.extraOptions = ''
    experimetal-features = nix-command flakes
  '';

  # home-manager configuration
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    extraSpecialArgs = {
      inherit inputs;
    };
    sharedModules = [
      {
        nixpkgs.overlays = [
          inputs.hyprpanel.overlay
        ];
      }
    ];
    useGlobalPkgs = true;
  };
}
