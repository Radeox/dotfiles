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

      # Colors (Kanagawa)
      colors = {
        primary = {
          background = "#1f1f28";
          foreground = "#dcd7ba";
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
      };

      # Remove window decorations
      window = { decorations = "None"; };

      # SSH fix
      env.TERM = "xterm-256color";
    };
  };
}
