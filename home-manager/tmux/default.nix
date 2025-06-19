{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    keyMode = "vi";
    mouse = true;
    # newSession = true;
    prefix = "C-Space";
    # tmuxinator = true;
    # tmuxp = true;
    escapeTime = 0;
    extraConfig = # tmux
      ''
        # for 256 color support
        set -ag terminal-overrides ",xterm-256color:Tc"

        # goes to visual mode
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

        # move status position to the top
        set-option -g status-position top
      '';
    plugins = with pkgs.tmuxPlugins; [
      cpu
      resurrect
      {
        plugin = catppuccin;
        extraConfig = ''
          # Configure the catppuccin plugin
          set -g @catppuccin_window_status_style "basic"

          # Make the status line pretty and add some modules
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
        '';
      }
      {
        plugin = tmux-fzf;
        extraConfig = ''
          TMUX_FZF_OPTIONS="-p 85% -m"
        '';
      }
      {
        plugin = pain-control;
        extraConfig = ''
          set -g @pane-resize "10"
        '';
      }
      {
        plugin = yank;
        extraConfig = ''
          set -g @plugin 'tmux-plugins/tmux-yank'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
      # {
      #   plugin = tilish;
      #   extraConfig = ''
      #     set -g @tilish-navigate 'on'
      #     set -g @tilish-default 'main-vertical'
      #   '';
      # }
    ];
  };
}
