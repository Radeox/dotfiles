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
      window = { decorations = "None"; };

      # Mouse
      mouse = { hide_when_typing = true; };

      # Colors (Catpuccin Frappe)
      colors = {
        primary = {
          background = "#303446";
          foreground = "#C6D0F5";
          dim_foreground = "#C6D0F5";
          bright_foreground = "#C6D0F5";
        };

        cursor = {
          text = "#303446";
          cursor = "#F2D5CF";
        };

        vi_mode_cursor = {
          text = "#303446";
          cursor = "#BABBF1";
        };

        search = {
          matches = {
            foreground = "#303446";
            background = "#A5ADCE";
          };
          focused_match = {
            foreground = "#303446";
            background = "#A6D189";
          };
          footer_bar = {
            foreground = "#303446";
            background = "#A5ADCE";
          };
        };

        hints = {
          start = {
            foreground = "#303446";
            background = "#E5C890";
          };
          end = {
            foreground = "#303446";
            background = "#A5ADCE";
          };
        };

        selection = {
          text = "#303446";
          background = "#F2D5CF";
        };

        normal = {
          black = "#51576D";
          red = "#E78284";
          green = "#A6D189";
          yellow = "#E5C890";
          blue = "#8CAAEE";
          magenta = "#F4B8E4";
          cyan = "#81C8BE";
          white = "#B5BFE2";
        };

        bright = {
          black = "#626880";
          red = "#E78284";
          green = "#A6D189";
          yellow = "#E5C890";
          blue = "#8CAAEE";
          magenta = "#F4B8E4";
          cyan = "#81C8BE";
          white = "#A5ADCE";
        };

        dim = {
          black = "#51576D";
          red = "#E78284";
          green = "#A6D189";
          yellow = "#E5C890";
          blue = "#8CAAEE";
          magenta = "#F4B8E4";
          cyan = "#81C8BE";
          white = "#B5BFE2";
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
