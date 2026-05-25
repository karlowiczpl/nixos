{ pkgs, ... }:

{
  opts = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    number = true;
    relativenumber = true;
    splitbelow = true;
    splitright = true;
  };

  keymaps = [
    {
      mode = "i";
      key = "<C-h>";
      action = "<left>";
      options = {
      	silent = true;
	      noremap = true;
      };
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<right>";
      options = {
      	silent = true;
	      noremap = true;
      };
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<down>";
      options = {
      	silent = true;
	      noremap = true;
      };
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<up>";
      options = {
      	silent = true;
	      noremap = true;
      };
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>Explore<CR>";
    }
    {
      mode = "v";
      key = "y";
      action = "ygv";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    {
      mode = [ "n" "v" ];
      key = "d";
      action = "\"_d";
    }
    {
      mode = [ "n" "v" ];
      key = "x";
      action = "\"_x";
    }
    {
      mode = "n";
      key = "U";
      action = "<C-r>";
    }
  ];
}
