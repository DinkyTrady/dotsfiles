{ pkgs, lib, ... }:
{
  # for tty
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i28b.psf.gz";
    packages = [ pkgs.terminus_font ];
    useXkbConfig = true;
  };

  # for the desktop
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = lib.mkForce [
          "JetBrainsMono Nerd Font"
          "DejaVu Serif Mono"
        ];
        serif = lib.mkForce [
          "NotoSerif Nerd Font"
          "NotoSerif"
          "DejaVu Serif"
        ];
        sansSerif = lib.mkForce [
          "NotoSans Nerd Font"
          "NotoSans"
          "DejaVu Sans"
        ];
        emoji = lib.mkForce [ "Noto Color Emoji" ];
      };
    };
    packages = with pkgs; [
      # default fonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      dejavu_fonts

      font-awesome

      # nerdfonts
      nerd-fonts.noto
      nerd-fonts.jetbrains-mono
    ];
    fontDir.enable = true;
  };
}
