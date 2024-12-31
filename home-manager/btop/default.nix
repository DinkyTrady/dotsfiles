{ config }:
{
  programs.btop = {
    enable = true;
    extraConfig = "
      vim_keys = True
      rounded_corners = True
      graph_symbol = block
      update_ms = 1000
      proc_sorting = memory
      proc_tree = True
      proc_aggregate = True
    ";
  };
  xdg.desktopEntries = {
    btop = {
      name = "btop++";
      genericName = "System Monitor";
      comment = "Resource monitor that shows usage and stats for processor, memory, disks, network and processes";
      icon = "btop";
      exec = "alacritty --class float -e btop";
      terminal = false;
      categories = [
        "System"
        "ConsoleOnly"
        "Monitor"
      ];
      settings.Keywords = "system;process;task";
    };
  };
}
