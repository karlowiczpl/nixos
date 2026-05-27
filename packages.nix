{ config, pkgs, ...}:
let
  cli = with pkgs; [
    unzip
  ];
  network = with pkgs; [
    nmap
    arp-scan
    google-chrome
  ];
  gui = with pkgs; [
    nautilus
    alacritty
    spotify
  ];
  virt = with pkgs; [
    gnome-boxes
  ];
  dev = with pkgs; [
    gcc
    git
  ];
  sys = with pkgs; [
    grc
    home-manager
    gtk3
    glib
    gsettings-desktop-schemas
    xdg-desktop-portal
    xdg-desktop-portal-gtk

    # Nadpisujemy FreeCAD bezpośrednio w jego własnym wrapperze QT
    (freecad.overrideAttrs (oldAttrs: {
      qtWrapperArgs = (oldAttrs.qtWrapperArgs or []) ++ [
        "--prefix" "XDG_DATA_DIRS" ":" "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
      ];
    }))
  ];
in

{
  environment.systemPackages = 
    cli
    ++ network
    ++ gui
    ++ virt
    ++ dev
    ++ sys;

  programs.dconf.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };

  environment.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
  };
}
