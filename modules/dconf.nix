{ pkgs, ... }:

{
  dconf.settings = { 
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super><Shift>W" ];
      move-to-workspace-1 = [ "<Super><Shift>H" ];
      move-to-workspace-2 = [ "<Super><Shift>J" ];
      move-to-workspace-3 = [ "<Super><Shift>K" ];
      move-to-workspace-4 = [ "<Super><Shift>L" ];

      switch-to-workspace-1 = [ "<Super>H" ];
      switch-to-workspace-2 = [ "<Super>J" ];
      switch-to-workspace-3 = [ "<Super>K" ];
      switch-to-workspace-4 = [ "<Super>L" ];

      minimize = [ "" ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///etc/nixos/home-manager/wallpaper.jpg";
      picture-uri-dark = "file:///etc/nixos/modules/wallpaper.jpg";
      color-shading-type = "solid";  
    };
  };
}
