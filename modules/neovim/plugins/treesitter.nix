{ config, ... }:

{
  plugins.treesitter = {
    enable = true;
    highlights.enable = true;
    indent.enable = true;

    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      json
      lua
      make
      markdown
      markdown_inline
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
      c
      cpp
      rust
      cmake
      meson
      json5
      dockerfile
      zig
      go
      python
      sql
      proto
      ninja
      gitignore
      diff
      html
      css
    ];
  };
}
