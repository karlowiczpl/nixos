{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      keyboard.bindings = [
        {
          action = "SpawnNewInstance";
          key = "Return";
          mods = "Super|Shift";
        }
      ];

      colors = {
        primary = {
          foreground = "#d3c6aa";
          background = "#2d353b";
        };

        cursor = {
          text = "#2d353b";
          cursor = "#d3c6aa";
        };
        
        selection = {
          text = "#d3c6aa";
          background = "#414b51";
        };
        
        normal = {
          black = "#343f44";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };

        bright = {
          black = "#859289";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };
      };

      cursor.style = {
        shape = "Block";
        blinking = "Off";
      };

      font = {
        size = 14;

        bold = {
          family = "0xProto Nerd Font";
          style = "Bold";
        };

        bold_italic = {
          family = "0xProto Nerd Font";
          style = "BoldItalic";
        };

        italic = {
          family = "0xProto Nerd Font";
          style = "MediumItalic";
        };

        normal = {
          family = "0xProto Nerd Font";
          style = "Medium";
        };
      };

      selection= {
        save_to_clipboard = false;
      };

      window = {
        opacity = 1;
        startup_mode = "Maximized";
        decorations = "None";

        class = {
          general = "Alacritty";
          instance = "Alacritty";
        };

        padding = {
          x = 0;
          y = 0;
        };
      };

      general.live_config_reload = true;
    };
  };
}
