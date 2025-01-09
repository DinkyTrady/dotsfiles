{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rust-analyzer
    rustfmt
    rustc
    cargo

    # toml file
    taplo
  ];
}
