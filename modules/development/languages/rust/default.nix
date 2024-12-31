{ pkgs, ... }:
{
  environtment.systemPackages = with pkgs; [
    rustup

    # toml file
    taplo
  ];
}
