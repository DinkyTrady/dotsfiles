{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # python314
    # pyright
    # basedpyright
    # ruff
    # ruff-lsp
  ];
}
