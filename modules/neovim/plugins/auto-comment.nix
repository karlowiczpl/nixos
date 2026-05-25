{ pkgs, ... }:

{
  plugins.comment = {
    enable = true;

    settings = {
      toggler = {
        line = "<leader>c";
      };

      opleader = {
        line = "<leader>c";
        block = "<leader>gc";
      };
    };
  };
}
