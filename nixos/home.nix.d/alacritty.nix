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

      # Gruvbox dark
      colors = {
        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };

        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
    };
  };
}
