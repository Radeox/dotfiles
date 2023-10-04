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
          background = "#1E1E2E";
          foreground = "#CDD6F4";

          dim_foreground = "#CDD6F4";
          bright_foreground = "#CDD6F4";
        };

        cursor = {
          text = "#1E1E2E";
          cursor = "#F5E0DC";
        };

        vi_mode_cursor = {
          text = "#1E1E2E";
          cursor = "#B4BEFE";
        };

        search = {
          matches = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
          focused_match = {
            foreground = "#1E1E2E";
            background = "#A6E3A1";
          };
          footer_bar = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
        };

        hints = {
          start = {
            foreground = "#1E1E2E";
            background = "#F9E2AF";
          };
          end = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
        };

        selection = {
          text = "#1E1E2E";
          background = "#F5E0DC";
        };

        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };

        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };

        dim = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };

        indexed_colors = [
          {
            index = 16;
            color = "#FAB387";
          }
          {
            index = 17;
            color = "#F5E0DC";
          }
        ];
      };
    };
  };
}
