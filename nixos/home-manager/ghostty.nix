{ ... }: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "Ayu";
      font-size = 13;
      window-decoration = "none";
      resize-overlay = "never";

      # Fix for legacy SSH terminal issues
      shell-integration-features = "ssh-env";

      # --- Key bindings ---
      keybind = [
        # New tab
        "ctrl+t=new_tab"

        # Fullscreen
        "ctrl+f=toggle_fullscreen"
        "f11=toggle_fullscreen"

        # Splits
        "ctrl+e>up=new_split:up"
        "ctrl+e>down=new_split:down"
        "ctrl+e>left=new_split:left"
        "ctrl+e>right=new_split:right"

        # Move between splits
        "ctrl+up=goto_split:up"
        "ctrl+down=goto_split:down"
        "ctrl+left=goto_split:left"
        "ctrl+right=goto_split:right"

        # Resize splits
        "ctrl+shift+up=resize_split:up,10"
        "ctrl+shift+down=resize_split:down,10"
        "ctrl+shift+left=resize_split:left,10"
        "ctrl+shift+right=resize_split:right,10"
      ];
    };
  };
}
