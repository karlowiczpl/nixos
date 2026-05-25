{inputs, ...}:

{
  imports = [ 
    inputs.nixvim.homeModules.nixvim
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    plugins.lz-n.enable = true;
    globals.mapleader = " ";
    nixpkgs.source = inputs.nixpkgs;
    plugins.luasnip.enable = true;

    imports = [
      ./colorscheme.nix
      ./keymaps.nix
      ./plugins
    ];
  };
}
