{
  inputs,
  config,
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
  };
  xdg.configFile."wezterm/wezterm.lua".source =
    config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/wezterm";
  xdg.desktopEntries.wezterm = {
    name = "WezTerm";
    comment = "Wez's Terminal Emulator";
    icon = "org.wezfurlong.wezterm";
    exec = "wezterm";
    type = "Application";
    categories = [
      "System"
      "TerminalEmulator"
      "Utility"
    ];
    settings.Keywords = "shell;prompt;command;commandline;cmd;";
  };
}
