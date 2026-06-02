{ config, pkgs, ... }:

{
  services = {
    displayManager = {
      gdm.enable = true;
    };

    desktopManager = {
      gnome.enable = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "pl";
        variant = "";
      };
    };

    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;

      gnome-settings-daemon = {
        enable = true;
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" ];
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gsconnect
  ];

  programs.dconf = {
    enable = true;
  };
}
