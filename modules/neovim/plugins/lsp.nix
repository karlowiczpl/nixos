{ pkgs, config, ... }:

{
  home.packages = [
    pkgs.luajit
    (pkgs.luajit.withPackages (ps: with ps; [
      pkgs.luaPackages.luafilesystem
      pkgs.luaPackages.luv
      pkgs.luaPackages.cjson
    ]))
  ];

  inlayHints.enable = true;
  programs.luasnip.enable = true;

  plugins = {
    lsp = {
      enable = true;
      capabilities = "require('cmp_nvim_lsp').default_capabilities()";

      servers = {
        nixd.enable = true;
        bashls.enable = true;
        clangd = {
          enable = true;
          cmd = [
            "${pkgs.clang-tools}/bin/clangd"
            "--header-insertion=never"
          ];
        };
        ruff.enable = true;
        gopls.enable = true;
        pyright.enable = true;
        lua_ls.enable = true;
        ts_ls.enable = true;
        html.enable = true;
        cssls.enable = true;
        esonls.enable = true;
        yamlls.enable = true;
        dockerls.enable = true;
        taplo.enable = true;
        cmake.enable = true;
        rust_analyzer = {
          enable = true;

          installCargo = true;
          installRustc = true;
        };
      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];

        preselect = "None";
        completion = {
          completeopt = "menu,menuone,noselect,noinsert";
        };

        matching = {
          disallow_fuzzy_matching = false;
          disallow_fulltext_matching = false;
          disallow_partial_fuzzy_matching = false;
          disallow_partial_matching = false;
          disallow_prefix_unmatching = false;
        };

        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
  };
}
