{ pkgs, ... }:
{
  # Install GNOME extensions
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    clipboard-indicator
    color-picker
    user-themes
    vertical-workspaces
  ];

  # Configure GNOME
  dconf = {
    enable = true;

    settings = {
      "org/gnome/shell" = {
        # Enable GNOME extensions
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          blur-my-shell.extensionUuid
          clipboard-indicator.extensionUuid
          color-picker.extensionUuid
          user-themes.extensionUuid
          vertical-workspaces.extensionUuid
        ];

        disable-user-extensions = false;
      };

      "org/gnome/desktop/wm/keybindings" = {
        # Set keybinds
        switch-input-source = [ "<Alt>space" ];
        switch-input-source-backward = [ "<Shift><Alt>space" ];
        close = [
          "<Super>q"
          "<alt>f4"
        ];

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

      # Custom keybindings
      "org/gnome/settings-daemon/plugins/media-keys" = {
        # Lock screen
        screensaver = [ "<Super>l" ];

        # Filemanager
        home = [ "<Super>f" ];

        # Firefox
        www = [ "<Super>b" ];

        # Disable
        email = [ ];
        rotate-video-lock-static = [ ];

        # Add more custom keybindings
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        ];
      };

      # Ghostty
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Terminal";
        command = "ghostty";
        binding = "<Super>t";
      };

      # Obsidian
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Obsidian";
        command = "flatpak run md.obsidian.Obsidian";
        binding = "<Super>h";
      };

      # Thunderbird
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        name = "Thunderbird";
        command = "flatpak run org.mozilla.Thunderbird";
        binding = "<Super>m";
      };

      # Ferdium
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        name = "Ferdium";
        command = "flatpak run org.ferdium.Ferdium";
        binding = "<Super>j";
      };

      # Spotify
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
        name = "Spotify";
        command = "flatpak run com.spotify.Client";
        binding = "<Super>n";
      };

      # V-Shell config
      "org/gnome/shell/extensions/vertical-workspaces" = {
        center-app-grid = true;
        center-dash-to-ws = true;
        dash-bg-gs3-style = false;
        dash-position = 1;
        dash-position-adjust = 0;
        secondary-ws-preview-shift = false;
        show-app-icon-position = 1;
        ws-thumbnails-full = false;
        ws-thumbnails-position = 9;
        wst-position-adjust = 100;
      };

      # Override CapsLock to Escape
      "org/gnome/desktop/input-sources" = {
        xkb-options = [
          "caps:escape"
          "lv3:ralt_switch"
          "terminate:ctrl_alt_bksp"
        ];
      };

      "org/gnome/mutter" = {
        edge-tiling = false;
        experimental-features = [
          # Enables fractional scaling (125% 150% 175%)
          "scale-monitor-framebuffer"

          # Enables Variable Refresh Rate (VRR) on compatible displays
          "variable-refresh-rate"

          # Scales Xwayland applications to look crisp on HiDPI screens
          "xwayland-native-scaling"
        ];
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
