{ pkgs, ... }:
{
  environtment.systemPackages = with pkgs; [
    gcc # dunno
    clang # dunno
    clang-tools
    vscode-extensions.vadimcn.vscode-lldb
  ];
}
