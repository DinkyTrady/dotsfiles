{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc # dunno
    # clang # dunno
    clang-tools

    gnumake
    cmake
    # vscode-extensions.vadimcn.vscode-lldb
  ];
}
