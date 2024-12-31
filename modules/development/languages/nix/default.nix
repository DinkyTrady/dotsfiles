{ pkgs, ... }:
{
  environtment.systemPackages = with pkgs; [
    nil
    nixd
    nixfmt-rfc-style
  ];
}
