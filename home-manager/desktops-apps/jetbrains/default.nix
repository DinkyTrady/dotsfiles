{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (jetbrains.idea-community-bin.override { jdk = temurin-bin; })
  ];
}
