{ pkgs, ... }: {
  # Install GNOME extensions
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    battery-health-charging
    clipboard-indicator
    color-picker
    gsconnect
    paperwm
    user-themes
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
          clipboard-indicator.extensionUuid
          color-picker.extensionUuid
          gsconnect.extensionUuid
          paperwm.extensionUuid
          user-themes.extensionUuid
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
        # Selection style
        selection-border-size = 2;
        selection-border-radius-bottom = 4;
        selection-border-radius-top = 4;

        # Gaps
        window-gap = 8;
        horizontal-margin = 8;
        vertical-margin = 8;
        vertical-margin-bottom = 8;

        # Misc
        disable-scratch-in-overview = true;
        disable-topbar-styling = false;
        last-used-display-server = "Wayland";
        only-scratch-in-overview = false;
        restore-attach-modal-dialogs = false;
        restore-edge-tiling = false;
        restore-workspaces-only-on-primary = false;
        show-focus-mode-icon = false;
        show-open-position-icon = false;
        show-window-position-bar = false;
        show-workspace-indicator = false;
        edge-preview-scale = 0.14;

        # Height/Widht steps
        cycle-height-steps = [ 0.38 0.5 0.61 ];
        cycle-width-steps = [ 0.5 1.0 ];

        winprops = [
          # All windows open at 100% width
          "{\"wm_class\":\"*\",\"preferredWidth\":\"100%\"}"

          # Pixel Access window opens in scratch layer
          "{\"wm_class\":\"\",\"title\":\"Pixel Access\",\"scratch_layer\":true}"
        ];
      };

      # PaperWM keybindings
      "org/gnome/shell/extensions/paperwm/keybindings" = {
        move-down = [ "<Shift><Super>Down" ];
        move-down-workspace = [ "<Shift><Control><Alt>Down" ];
        move-left = [ "<Shift><Super>Left" ];
        move-right = [ "<Shift><Super>Right" ];
        move-up = [ "<Shift><Super>Up" ];
        move-up-workspace = [ "<Shift><Control><Alt>Up" ];
        paper-toggle-fullscreen = [ "<Super>y" ];
        switch-global-down = [ "<Super>Down" ];
        switch-global-left = [ "<Super>Left" ];
        switch-global-right = [ "<Super>Right" ];
        switch-global-up = [ "<Super>Up" ];
        switch-up-workspace = [ "<Control><Alt>Up" ];
        switch-down-workspace = [ "<Control><Alt>Down" ];
        toggle-scratch = [ "<Super>grave" ];
        toggle-scratch-layer = [ "<Super>Escape" ];
        barf-out-active = [ "<Super>e" ];
        slurp-in = [ "<Super>c" ];

        # Disabled default keybindings
        barf-out = [ ];
        center-horizontally = [ ];
        center-vertically = [ ];
        close-window = [ ];
        cycle-height = [ ];
        cycle-height-backwards = [ ];
        live-alt-tab = [ ];
        live-alt-tab-backward = [ ];
        live-alt-tab-scratch = [ ];
        live-alt-tab-scratch-backward = [ ];
        move-monitor-above = [ ];
        move-monitor-below = [ ];
        move-monitor-left = [ ];
        move-monitor-right = [ ];
        move-space-monitor-above = [ ];
        move-space-monitor-below = [ ];
        new-window = [ ];
        previous-workspace = [ ];
        previous-workspace-backward = [ ];
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
        toggle-maximize-width = [ ];
        toggle-scratch-window = [ ];
        toggle-top-and-position-bar = [ ];
      };

      # Override CapsLock to Escape
      "org/gnome/desktop/input-sources" = {
        xkb-options = [
          "caps:escape"
          "lv3:ralt_switch"
          "terminate:ctrl_alt_bksp"
        ];
      };

      # Alacritty
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Terminal";
        command = "alacritty";
        binding = "<Super>t";
      };

      # Ferdium
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Ferdium";
        command = "flatpak run org.ferdium.Ferdium";
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
