{ pkgs, ... }:
{
  environtment.systemPackages = with pkgs; [
    lua-language-server
    stylua
  ];
}
