{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      userName = "DinkyTrady";
      userEmail = "DinkyTrady@kyra.com";
      extraConfig = {
        init = {
          defaultBranch = [
            "main"
            "master"
          ];
        };
        pull = {
          rebase = false;
        };
      };
    };
    gh = {
      enable = true;
      extensions = [
        pkgs.gh-copilot
      ];
    };
    gh-dash = {
      enable = false;
    };
    lazygit = {
      enable = true;
    };
  };
}
