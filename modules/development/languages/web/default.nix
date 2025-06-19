{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emmet-language-server
    vscode-langservers-extracted
    nodePackages.prettier
    live-server

    marksman
    markdownlint-cli2
    markdown-oxide
  ];
}
