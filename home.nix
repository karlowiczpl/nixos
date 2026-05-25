{ pkgs, ... }: 

{
  home = {
    username = "karol";
    homeDirectory = "/home/karol/";

    stateVersion = "25.11";

    packages = with pkgs; [
      tree-sitter
      ripgrep
      grc

      nerd-fonts._0xproto
    ];
  };

  imports = [
    ./modules
  ];
}
