{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc # dunno
    clang # dunno
    clang-tools

    lldb
    # vscode-extensions.vadimcn.vscode-lldb
  ];
}
