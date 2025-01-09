{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
    };
    # fonts = {
    #   sansSerif = {
    #     name = "NotoSans Nerd Font";
    #     package = pkgs.nerd-fonts.noto;
    #   };
    #   serif = {
    #     name = "NotoSerif Nerd Font";
    #     package = pkgs.nerd-fonts.noto;
    #   };
    #   monospace = {
    #     name = "JetBrainsMono Nerd Font";
    #     package = pkgs.nerd-fonts.jetbrains-mono;
    #   };
    #   emoji = {
    #     name = "Noto Color Emoji";
    #     package = pkgs.noto-fonts-emoji;
    #   };
    # };
    image = ../dots/Wallpaper/wanella.jpg;
    polarity = "dark";
  };
  # environment.systemPackages = with pkgs; [
  #   dejavu_fonts
  # ];
}
