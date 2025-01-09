{ pkgs, lib, ... }:
{
  services = {
    # enabling x11
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      videoDrivers = [ "nvidia" ];
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a . %h | %F' --cmd Hyprland";
          user = "greeter";
        };
        initial_session = {
          command = "Hyprland";
          user = "kyra";
        };
      };
    };

    # display manager for login
    displayManager = {
      enable = lib.mkDefault false;
      defaultSession = "hyprland"; # set default sessions to hyprland
      ly = {
        enable = false;
      };
      # not working i dunno why
      sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "weston";
        };
      };
    };

    # Sound
    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };

    # Keyboard mapper
    kanata = {
      enable = true;
      keyboards.internalKeyboard = {
        configFile = ../dots/kanata/kanata.kbd;
      };
    };

    # enable mysql
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    # touchpad support, is it used?
    libinput.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # ssh not for now
    # openssh.enable = true;
  };
}
