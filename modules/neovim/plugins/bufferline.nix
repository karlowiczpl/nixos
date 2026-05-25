{ pkgs, ... }:

{
  plugins.web-devicons.enable = true;
  plugins.bufferline = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Next Buffer";
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Prev Buffer";
      };
    }
    {
      mode = "n";
      key = "<Leader>x";
      action = "<cmd>bdelete!<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Close Current Buffer";
      };
    }
  ];
}
