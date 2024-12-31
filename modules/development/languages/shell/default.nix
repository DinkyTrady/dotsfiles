{ pkgs }:
{
  environtment.systemPackages = with pkgs; [
    bash-language-server
    shellcheck
    shfmt
  ];
}
