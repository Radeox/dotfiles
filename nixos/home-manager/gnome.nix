{ pkgs, ... }: {
  # Install GNOME extensions
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    battery-health-charging
    blur-my-shell
    clipboard-indicator
    color-picker
    dash-to-dock
    gsconnect
    pop-shell
    vertical-workspaces
  ];

  # Configure GNOME
  dconf = {
    enable = true;

    settings = {
      "org/gnome/shell" = {
        # Enable GNOME extensions
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          battery-health-charging.extensionUuid
          blur-my-shell.extensionUuid
          clipboard-indicator.extensionUuid
          color-picker.extensionUuid
          dash-to-dock.extensionUuid
          gsconnect.extensionUuid
          pop-shell.extensionUuid
          vertical-workspaces.extensionUuid
        ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        # Set keybinds
        switch-to-workspace-up = [ "<Ctrl><Alt>up" ];
        switch-to-workspace-down = [ "<Ctrl><Alt>down" ];
        move-to-workspace-up = [ "<Ctrl><Shift><Alt>up" ];
        move-to-workspace-down = [ "<Ctrl><Shift><Alt>down" ];
        toggle-maximized = [ "<Super>Home" ];
        switch-input-source = [ "<Alt>space" ];
        switch-input-source-backward = [ "<Shift><Alt>space" ];
        close = [ "<Super>q" "<alt>f4" ];

        # Disable some default keybinds
        maximize = [ ];
        minimize = [ ];
        unmaximize = [ ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-monitor-up = [ ];
        switch-to-workspace-left = [ ];
        switch-to-workspace-right = [ ];
        move-to-workspace-1 = [ ];
        switch-to-workspace-1 = [ ];
        move-to-workspace-2 = [ ];
        switch-to-workspace-2 = [ ];
        move-to-workspace-3 = [ ];
        switch-to-workspace-3 = [ ];
        move-to-workspace-4 = [ ];
        switch-to-workspace-4 = [ ];
      };
      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = [ "<Shift><Super>s" ];
        screenshot = [ "<Print>" ];

        open-application-menu = [ ];
        toggle-message-tray = [ ];
        toggle-overview = [ "<Super>space" ];
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        # Lock screen
        screensaver = [ "<Super>l" ];

        # Filemanager
        home = [ "<Super>f" ];

        # Thunderbird
        email = [ "<Super>m" ];

        # Firefox
        www = [ "<Super>b" ];

        # Disable
        rotate-video-lock-static = [ ];
      };
      # Pop-shell keybinds
      "org/gnome/shell/extensions/pop-shell" = {
        toggle-floating = [ "<Super>g" ];
        search = [ ];

        focus-left = [ "<Super>Left" ];
        focus-right = [ "<Super>Right" ];
        focus-up = [ "<Super>Up" ];
        focus-down = [ "<Super>Down" ];

        # Tile mode
        tile-enter = [ "<Super>r" ];

        tile-resize-left = [ "Left" ];
        tile-resize-right = [ "Right" ];
        tile-resize-up = [ "Up" ];
        tile-resize-down = [ "Down" ];

        tile-swap-left = [ "<Shift>Left" ];
        tile-swap-right = [ "<Shift>Right" ];
        tile-swap-up = [ "<Shift>Up" ];
        tile-swap-down = [ "<Shift>Down" ];

        tile-move-left = [ "<Ctrl>Left" ];
        tile-move-right = [ "<Ctrl>Right" ];
        tile-move-up = [ "<Ctrl>Up" ];
        tile-move-down = [ "<Ctrl>Down" ];
      };
      # Alacritty
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Terminal";
        command = "alacritty";
        binding = "<Super>t";
      };
      # Telegram
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Telegram";
        command = "telegram-desktop";
        binding = "<Super>j";
      };
      "org/gnome/mutter" = {
        workspaces-only-on-primary = false;
        edge-tiling = false;
        overlay-key = "";
      };
      "org/gnome/mutter/wayland/keybindings" = {
        # Restore the keyboard shortcuts: disable <Super>escape
        restore-shortcuts = [ ];
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = false;
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        toolkit-accessibility = true;
      };
      "org/gnome/mutter/keybindings" = {
        # Disable tiling to left / right of screen
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };
    };
  };
}
