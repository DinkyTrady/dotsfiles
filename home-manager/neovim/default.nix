{
  config,
  ...
}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
  };
  xdg.configFile."nvim/init.lua".enable = false;
  xdg.configFile."nvim" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "/home/kyra/newdots/dots/nvim";
  };
}
