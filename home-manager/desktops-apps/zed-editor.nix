{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = false;
    package = pkgs.zed-editor-fhs;
    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "html"
      "emmet"
      "java"
      "sql"
    ];
    userSettings = {
      features = {
        copilot = true;
      };
      vim_mode = true;
    };
  };
}
