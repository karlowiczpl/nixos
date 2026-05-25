{ pkgs, lib, imports, ... }:

{
  imports = [
    ./neovim
    ./alacritty.nix
    ./shell.nix
    ./firefox.nix
  ];
}
