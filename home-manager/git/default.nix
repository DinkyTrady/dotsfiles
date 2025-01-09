{ ... }:
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
      };
    };
    gh = {
      enable = true;
    };
    gh-dash = {
      enable = true;
    };
    lazygit = {
      enable = true;
    };
  };
}
