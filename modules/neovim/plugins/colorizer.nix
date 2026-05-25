{ pkgs, ... }:

{
  plugins.colorizer = {
    enable = true;
    settings = {
      user_default_options = {
        names = false;
        RGB = true;
        RRGGBB = true;
        AARRGGBB = true;
        RRGGBBAA = true;
        hex_color = true;
        hsl_fn = true;
        rgb_fn = true;
        css = true;
        css_fn = true;
        mode = "background";
      };
    };
  };
}
