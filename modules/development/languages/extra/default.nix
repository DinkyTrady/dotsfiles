{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprlang

    sqlfluff
  ];
}
