{ ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      # Key bindings
      keyboard = {
        bindings = [
          {
            key = "T";
            mods = "Control|Shift";
            action = "CreateNewWindow";
          }
          {
            key = "F";
            mods = "Control";
            action = "ToggleFullScreen";
          }
          {
            key = "T";
            mods = "Control";
            action = "ReceiveChar";
          }
          {
            key = "Space";
            mods = "Control|Shift";
            action = "ReceiveChar";
          }
          {
            key = "B";
            mods = "Control|Shift";
            action = "ReceiveChar";
          }
        ];
      };

      # Fonts
      font = {
        size = 13.0;

        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Regular";
        };
      };

      # Colors (Ayu Dark)
      colors = {
        primary = {
          background = "#0A0E14";
          foreground = "#B3B1AD";
        };

        normal = {
          black = "#01060E";
          red = "#EA6C73";
          green = "#91B362";
          yellow = "#F9AF4F";
          blue = "#53BDFA";
          magenta = "#FAE994";
          cyan = "#90E1C6";
          white = "#C7C7C7";
        };

        bright = {
          black = "#686868";
          red = "#F07178";
          green = "#C2D94C";
          yellow = "#FFB454";
          blue = "#59C2FF";
          magenta = "#FFEE99";
          cyan = "#95E6CB";
          white = "#FFFFFF";
        };
      };

      # Remove window decorations
      window = { decorations = "None"; };

      # SSH fix
      env.TERM = "xterm-256color";
    };
  };
}
