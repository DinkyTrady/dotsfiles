{ pkgs, ... }:
{
  home.packages = with pkgs.jetbrains; [
    (idea-ultimate.override {
      jdk = pkgs.temurin-bin;
      maven = pkgs.maven;
    })
    (pycharm-professional.override {
      jdk = pkgs.temurin-bin;
      maven = pkgs.maven;
    })
    (webstorm.override {
      jdk = pkgs.temurin-bin;
      maven = pkgs.maven;
    })
    # (jetbrains.idea-community-bin.override {
    #   jdk = temurin-bin;
    #   maven = maven;
    # })
  ];
}
