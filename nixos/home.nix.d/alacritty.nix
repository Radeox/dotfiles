{ pkgs, ... }: {
  # Alacritty configuration
  programs.alacritty = {
    enable = true;

    settings = {
      # Keybindings
      key_bindings = [
        {
          key = "B";
          mods = "Control|Shift";
          chars = "\\x1b[66;5u";
        }
        {
          key = "R";
          mods = "Control|Shift";
          chars = "\\x1b[82;5u";
        }
        {
          key = "Slash";
          mods = "Control";
          chars = "\\x1b[47;5u";
        }
        {
          key = "Space";
          mods = "Control|Shift";
          chars = "\\x1b[32;6u";
        }
      ];

      # Fonts
      font = {
        size = 13.0;

        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Regular";
        };
      };

      # Window
      window = {
        decorations = "None";
        startup_mode = "Maximized";
      };

      # Colors (Catpuccin Macchiato - Green)
      colors = {
        primary = {
          background = "#2A363B";
          foreground = "#C3E88D";
          dim_foreground = "#C3E88D";
          bright_foreground = "#C3E88D";
        };
        cursor = {
          text = "#2A363B";
          cursor = "#C3E88D";
        };
        vi_mode_cursor = {
          text = "#2A363B";
          cursor = "#C3E88D";
        };
        search = {
          matches = {
            foreground = "#2A363B";
            background = "#A5ADCE";
          };
          focused_match = {
            foreground = "#2A363B";
            background = "#A6D189";
          };
          footer_bar = {
            foreground = "#2A363B";
            background = "#A5ADCE";
          };
        };
        hints = {
          start = {
            foreground = "#2A363B";
            background = "#E5C890";
          };
          end = {
            foreground = "#2A363B";
            background = "#A5ADCE";
          };
        };
        selection = {
          text = "#2A363B";
          background = "#F2D5CF";
        };
        normal = {
          black = "#1B2B34";
          red = "#EC5f67";
          green = "#99C794";
          yellow = "#FAC863";
          blue = "#6699CC";
          magenta = "#C594C5";
          cyan = "#5FB3B3";
          white = "#C7C7C7";
        };
        bright = {
          black = "#405B67";
          red = "#D08770";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#88C0D0";
          magenta = "#C594C5";
          cyan = "#5FB3B3";
          white = "#D0D0D0";
        };
        dim = {
          black = "#1B2B34";
          red = "#EC5f67";
          green = "#99C794";
          yellow = "#FAC863";
          blue = "#6699CC";
          magenta = "#C594C5";
          cyan = "#5FB3B3";
          white = "#C7C7C7";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#EF9F76";
          }
          {
            index = 17;
            color = "#F2D5CF";
          }
        ];
      };
    };
  };
}
