{ pkgs, ... }:

{
  programs.sesh.tmuxKey = "s";

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    historyLimit = 100000;
    prefix = "C-s";

    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set -s escape-time 0
      set -g default-terminal "screen-256color"
      set -g status-right "%Y-%m-%d %H:%M"
      set -as terminal-features ",xterm-256color:RGB"
      
      set -g status-style bg=black,fg=blue
      set -g window-status-current-style bg=blue,fg=black,bold
      set -g pane-border-style fg=grey
      set -g pane-active-border-style fg=blue
      set -g message-style bg=blue,fg=black

      set -g mouse on

      unbind '"'
      bind '"' split-window -v -p 30 -c"#{pane_current_path}"
    '';

    plugins = [
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
  };
}
