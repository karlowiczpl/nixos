{ pkgs, ... }:

{
  programs.bash = {
    initExtra = ''
      if grep -qv fish /proc/$PPID/comm && [[ $SHLVL == [12] ]]; then
          SHELL=${pkgs.fish}/bin/fish exec fish
      fi
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      set -g fish_color_autosuggestion 555 --dim
      fish_config theme choose Base16\ Default\ Dark
    '';

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      # {
      #   name = "hydro";
      #   src = pkgs.fishPlugins.hydro.src;
      # }
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces.src;
      }
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
    ];
  };
}
