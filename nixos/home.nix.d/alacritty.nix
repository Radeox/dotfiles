{ ... }: {
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

      # Kanagawa Wave
      colors = {
        primary = {
          background = "#1F1F28";
          foreground = "#DCD7BA";
        };

        selection = {
          background = "#2d4f67";
          foreground = "#c8c093";
        };

        normal = {
          black = "#090618";
          red = "#c34043";
          green = "#76946a";
          yellow = "#c0a36e";
          blue = "#7e9cd8";
          magenta = "#957fb8";
          cyan = "#6a9589";
          white = "#c8c093";
        };

        bright = {
          black = "#727169";
          red = "#e82424";
          green = "#98bb6c";
          yellow = "#e6c384";
          blue = "#7fb4ca";
          magenta = "#938aa9";
          cyan = "#7aa89f";
          white = "#dcd7ba";
        };

        indexed_colors = [
          {
            index = 16;
            color = "#ffa066";
          }

          {
            index = 17;
            color = "#ff5d62";
          }
        ];
      };
    };
  };
}
