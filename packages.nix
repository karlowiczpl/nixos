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
    home-manager
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
}
