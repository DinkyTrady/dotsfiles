{ }:
{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      userName = "DinkyTrady";
      userEmail = "DinkyTrady@kyra.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
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
