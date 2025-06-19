{ pkgs, lib, ... }:
let
  json = pkgs.formats.json { };
  pw_rnnoise_config = {
    "context.modules" = [
      {
        "name" = "libpipewire-module-filter-chain";
        "args" = {
          "node.description" = "Noise Canceling source";
          "media.name" = "Noise Canceling source";
          "filter.graph" = {
            "nodes" = [
              {
                "type" = "ladspa";
                "name" = "rnnoise";
                "plugin" = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                "label" = "noise_suppressor_stereo";
                "control" = {
                  "VAD Threshold (%)" = 50.0;
                };
              }
            ];
          };
          "audio.position" = [
            "FL"
            "FR"
          ];
          "capture.props" = {
            "node.name" = "effect_input.rnnoise";
            "node.passive" = true;
            "audio.rate" = 48000;
          };
          "playback.props" = {
            "node.name" = "effect_output.rnnoise";
            "media.class" = "Audio/Source";
            "audio.rate" = 48000;
          };
        };
      }
    ];
  };
in
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
      ly.enable = false;
      # not working i dunno why
      sddm = {
        enable = false;
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
      extraConfig.pipewire."99-input-denoising" = pw_rnnoise_config;
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

    udisks2.enable = true;

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

  security.rtkit.enable = true;
}
