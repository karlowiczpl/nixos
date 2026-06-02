{ pkgs, lib, imports, ... }:

{
  imports = [
    ./neovim
    ./alacritty.nix
    ./shell.nix
    ./firefox.nix
    ./dconf.nix
    ./virt.nix
    ./tmux.nix
    ./microchip.nix
  ];
}
