{ pkgs }:
{
  environtment.systemPackages = with pkgs; [
    hyprlang

    sqlfluff
  ];
}
