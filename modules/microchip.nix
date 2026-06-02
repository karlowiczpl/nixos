{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.extension = [
      pkgs.vscode-extensions.vscodevim.vim
    ];
  };
}
