{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (fenix.minimal.withComponents [
      "cargo"
      # "clippy"
      # "rustfmt"
      "rustc"
    ])
    rust-analyzer
    rustfmt

    # toml file
    taplo
  ];
}
