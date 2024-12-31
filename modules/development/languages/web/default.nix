{ pkgs, ... }:
{
  environtment.systemPackages = with pkgs; [
    vscode-langservers-extracted
    prettierd

    marksman
    markdownlint-cli2
  ];
}
