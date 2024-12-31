{ pkgs }:
{
  home.packages = with pkgs; [
    (netbeans.override { jdk21 = temurin-bin; })
  ];
}
