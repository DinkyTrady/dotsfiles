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
      '';
    plugins = with pkgs.tmuxPlugins; [
      cpu
      sessionist
      resurrect
      {
        plugin = tmux-fzf;
        extraConfig = ''
          TMUX_FZF_OPTIONS="-p 85% -m"
          # sessions
          bind s run-shell -b "${tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/session.sh" # switch menu

          # window
          bind w run-shell -b "${tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/window.sh" # window menu
          bind f run-shell -b "${tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/window.sh switch" # switch window
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
