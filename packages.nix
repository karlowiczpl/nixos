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
    prusa-slicer
  ];
  virt = with pkgs; [
    gnome-boxes
  ];
  dev = with pkgs; [
    gcc
    git
  ];
  microchip = with pkgs; [
  ];
  sys = with pkgs; [
    grc
    home-manager
    gtk3
    glib
    gsettings-desktop-schemas
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    inkscape

    (pkgs.symlinkJoin {
      name = "freecad-fixed";
      paths = [ pkgs.freecad ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/freecad \
          --prefix XDG_DATA_DIRS : "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}" \
          --prefix XDG_DATA_DIRS : "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}" \
          --set GSETTINGS_SCHEMA_DIR "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas"
      '';
    })
  ];
in

{
  environment.systemPackages = 
    cli
    ++ network
    ++ gui
    ++ virt
    ++ dev
    ++ sys
    ++ microchip;

  programs.dconf.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.extraInit = ''
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  '';

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
