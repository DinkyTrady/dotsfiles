{ pkgs, lib, ... }:
let
in
# Source: https://maulana.id/soft-dev/2023--09--10--00--using-nix-override-attrs/
# bun-new = pkgs.bun.overrideAttrs (
#   final: prev: rec {
#     version = "1.2.2";
#     src =
#       passthru.sources.${pkgs.stdenvNoCC.hostPlatform.system}
#         or (throw "Unsupported system: ${pkgs.stdenvNoCC.hostPlatform.system}");
#     passthru = prev.passthru // {
#       sources = prev.passthru.sources // {
#         "x86_64-linux" = pkgs.fetchurl {
#           url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64.zip";
#           # update hash
#           hash = "sha256-Q4DjmFTLTIqt8jfI9dJwJWSaK0lwXakc4zBm3pWdUug=";
#         };
#       };
#     };
#   }
# );
{
  environment.systemPackages = with pkgs; [
    nodejs
    typescript
    eslint
    bun
    # bun-new
  ];
}
