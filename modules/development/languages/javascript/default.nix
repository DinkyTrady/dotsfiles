{ pkgs, ... }:
{
  environtment.systemPackages = with pkgs; [
    typescript
    eslint
  ];
}
