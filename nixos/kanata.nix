{ ... }:
{
  services.kanata = {
    enable = true;
    keyboards.internalKeyboard = {
      configFile = ../dots/kanata/kanata.kbd; # default keybind for everything
      # configFile = ../dots/kanata/kanata-gaming.kbd; # used for playing game in waydroid or menkref
    };
  };
}
