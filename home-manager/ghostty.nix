{ ... }:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "Everforest Dark Hard";
      font-size = 13;
      window-decoration = "none";
      resize-overlay = "never";

      # Fix for legacy SSH terminal issues
      shell-integration-features = "ssh-env";

      # Disable clipboard paste protection
      clipboard-paste-protection = false;

      # --- Key bindings ---
      keybind = [
        # New tab
        "ctrl+t=new_tab"

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

        # Fullscreen
        "f11=toggle_fullscreen"
      ];
    };
  };
}
