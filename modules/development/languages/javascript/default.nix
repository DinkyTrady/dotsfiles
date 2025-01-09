{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    typescript
    eslint
  ];
}
