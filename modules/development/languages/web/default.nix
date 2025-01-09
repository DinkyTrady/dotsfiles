{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode-langservers-extracted
    nodePackages.prettier

    marksman
    markdownlint-cli2
    markdown-oxide
  ];
}
