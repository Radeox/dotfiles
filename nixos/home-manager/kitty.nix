{ ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 13;
    };

    keybindings = {
      # Window management
      "f5" = "launch --location=vsplit --cwd=current";
      "f6" = "launch --location=hsplit --cwd=current";
      "f7" = "new_tab_with_cwd";
      "f8" = "set_window_title";

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

      # Unbind some key
      "ctrl+shift+r" = "";
    };

    settings = {
      enabled_layouts = "splits";
      hide_window_decorations = "yes";
      wheel_scroll_multiplier = "2.0";
    };

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
