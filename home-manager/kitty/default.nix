{ lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-cursor";
    font = {
      name = lib.mkForce "monospace";
      size = lib.mkForce 18;
    };
    settings = {
      cursor_shape = lib.mkForce "block";
      background_opacity = lib.mkForce 0.95;
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;
      scrollback_pager = "${pkgs.bash}/bin/bash -c \"exec ${pkgs.neovim}/bin/nvim 63<&0 0</dev/null -u NONE -c 'set background=dark' -c 'map <silent> q :qa!<CR>' -c 'set shell=bash scrollback=100000 termguicolors laststatus=0 clipboard+=unnamedplus number relativenumber' -c 'autocmd TermEnter * stopinsert' -c 'autocmd TermClose * call cursor(max([0,INPUT_LINE_NUMBER-1])+CURSOR_LINE, CURSOR_COLUMN)' -c 'terminal sed </dev/fd/63 -e \\\"s/'$'\\x1b'']8;;file:[^\\]*[\\]//g\\\" && sleep 0.01 && printf \\\"'$'\\x1b'']2;\\\"'\"";
      cursor_trail = 3;
    };
    themeFile = "Catppuccin-Mocha";
  };
}
