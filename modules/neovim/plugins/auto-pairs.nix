{ pkgs, ... }:

{
  plugins.nvim-autopairs = {
    enable = true;

    settings = {
      map_cr = false;
    };

    extraConfigLua = ''
      local npairs = require("nvim-autopairs")
      npairs.setup({
        map_cr = false
      })
    '';
  };
}
