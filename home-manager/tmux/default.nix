{ pkgs }:
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    keyMode = "vi";
    mouse = true;
    newSession = true;
    shortcut = "Space";
    # tmuxinator = true;
    extraConfig = ''
      # for 256 color support
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      set-option -sg escape-time 10

      # move window like neovim
      bind h select-pane -L
      bind j select-pane -D
      bind l select-pane -R
      bind k select-pane -U

      # goes to visual mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
    plugins = with pkgs.tmuxPlugins; [
      cpu
      {
        plugin = tmux-fzf;
        extraConfig = ''
          set -g @plugin 'sainnhe/tmux-fzf'
        '';
      }
      {
        plugin = yank;
        extraConfig = ''
          set -g @plugin 'tmux-plugins/tmux-yank'
        '';
      }
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
  };
}
