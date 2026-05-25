{ pkgs, ... }:

{
  imports = [
    ./auto-pairs.nix
    ./auto-comment.nix
    ./bufferline.nix
    ./colorizer.nix
    ./gitsigns.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./treesitter.nix
  ];
}
