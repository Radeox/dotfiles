{ ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 13;
    };

    keybindings = {
      # Window management
      "ctrl+f" = "toggle_fullscreen";
      "f5" = "new_tab_with_cwd";
      "f6" = "launch --location=vsplit";
      "f7" = "launch --location=hsplit";
      "f9" = "set_window_title";

      # Move focus
      "alt+down" = "neighboring_window down";
      "alt+left" = "neighboring_window left";
      "alt+right" = "neighboring_window right";
      "alt+up" = "neighboring_window up";

      # Resize window
      "ctrl+down" = "resize_window shorter";
      "ctrl+left" = "resize_window narrower";
      "ctrl+right" = "resize_window wider";
      "ctrl+up" = "resize_window taller";
    };

    settings = {
      hide_window_decorations = "yes";
    };

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
