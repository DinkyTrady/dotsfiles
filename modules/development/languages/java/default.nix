{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    temurin-bin

    (gradle.override { java = temurin-bin; }) # not used maybe
    (maven.override { jdk_headless = temurin-bin; })
    (lombok.override { jdk = temurin-bin; })
    (jdt-language-server.override { jdk = temurin-bin; })
  ];
}
