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

      # Remove window decorations
      window = { decorations = "None"; };
    };
  };
}
