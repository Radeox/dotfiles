{ pkgs, ... }: {
  # Install GNOME extensions
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    battery-health-charging
    blur-my-shell
    clipboard-indicator
    color-picker
    gsconnect
    paperwm
    quick-settings-tweaker
    user-themes
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
          gsconnect.extensionUuid
          paperwm.extensionUuid
          quick-settings-tweaker.extensionUuid
          user-themes.extensionUuid
          vertical-workspaces.extensionUuid
        ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        # Set keybinds
        switch-input-source = [ "<Alt>space" ];
        switch-input-source-backward = [ "<Shift><Alt>space" ];
        close = [ "<Super>q" "<alt>f4" ];

        # Disable some default keybinds
        switch-to-workspace-up = [ ];
        switch-to-workspace-down = [ ];
        toggle-maximized = [ ];
        move-to-workspace-up = [ ];
        move-to-workspace-down = [ ];
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

      # PaperWM config
      "org/gnome/shell/extensions/paperwm" = {
        disable-topbar-styling = false;
        edge-preview-scale = 0.14;
        horizontal-margin = 12;
        last-used-display-server = "Wayland";
        restore-attach-modal-dialogs = false;
        restore-edge-tiling = false;
        restore-workspaces-only-on-primary = false;
        selection-border-radius-bottom = 4;
        selection-border-radius-top = 4;
        selection-border-size = 6;
        show-window-position-bar = false;
        show-workspace-indicator = false;
        vertical-margin-bottom = 12;
        vertical-margin = 12;
        window-gap = 16;
      };

      # PaperWM keybindings
      "org/gnome/shell/extensions/paperwm/keybindings" = {
        move-down = [ "<Shift><Super>Down" ];
        move-down-workspace = [ "<Shift><Control><Alt>Down" ];
        move-left = [ "<Shift><Super>Left" ];
        move-right = [ "<Shift><Super>Right" ];
        move-up = [ "<Shift><Super>Up" ];
        move-up-workspace = [ "<Shift><Control><Alt>Up" ];
        paper-toggle-fullscreen = [ "<Super>Home" ];
        switch-global-down = [ "<Super>Down" ];
        switch-global-left = [ "<Super>Left" ];
        switch-global-right = [ "<Super>Right" ];
        switch-global-up = [ "<Super>Up" ];
        switch-up-workspace = [ "<Control><Alt>Up" ];
        switch-down-workspace = [ "<Control><Alt>Down" ];
        toggle-maximize-width = [ "<Super>y" ];
        toggle-scratch = [ "<Super>grave" ];
        toggle-scratch-layer = [ "<Super>Escape" ];

        # Disabled default keybindings
        barf-out-active = [ ];
        barf-out = [ ];
        center-horizontally = [ ];
        close-window = [ ];
        cycle-height-backwards = [ ];
        cycle-height = [ ];
        live-alt-tab-backward = [ ];
        live-alt-tab-scratch-backward = [ ];
        live-alt-tab-scratch = [ ];
        live-alt-tab = [ ];
        move-monitor-above = [ ];
        move-monitor-below = [ ];
        move-monitor-left = [ ];
        move-monitor-right = [ ];
        move-space-monitor-above = [ ];
        move-space-monitor-below = [ ];
        new-window = [ ];
        previous-workspace-backward = [ ];
        previous-workspace = [ ];
        slurp-in = [ ];
        swap-monitor-above = [ ];
        swap-monitor-below = [ ];
        swap-monitor-left = [ ];
        swap-monitor-right = [ ];
        switch-down = [ ];
        switch-first = [ ];
        switch-focus-mode = [ ];
        switch-last = [ ];
        switch-left = [ ];
        switch-monitor-above = [ ];
        switch-monitor-below = [ ];
        switch-monitor-left = [ ];
        switch-monitor-right = [ ];
        switch-open-window-position = [ ];
        switch-right = [ ];
        switch-up = [ ];
        take-window = [ ];
        toggle-scratch-window = [ ];
        toggle-top-and-position-bar = [ ];
      };

      # Kitty
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Terminal";
        command = "kitty";
        binding = "<Super>t";
      };

      # Telegram
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Telegram";
        command = "telegram-desktop";
        binding = "<Super>j";
      };

      # Spotify
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        name = "Spotify";
        command = "flatpak run com.spotify.Client";
        binding = "<Super>n";
      };

      "org/gnome/mutter" = {
        edge-tiling = false;
        experimental-features = [ "scale-monitor-framebuffer" ];
        overlay-key = "";
        workspaces-only-on-primary = false;
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
