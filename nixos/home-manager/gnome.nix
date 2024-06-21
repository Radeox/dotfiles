{ pkgs, ... }: {
  # Install GNOME extensions
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
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
        toggle-maximized = [ "<super>PageUp" ];
        close = [ "<super>q" "<alt>f4" ];

        # Disable some default keybinds
        maximize = [ ];
        minimize = [ ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-monitor-up = [ ];
        switch-to-workspace-left = [ ];
        switch-to-workspace-right = [ ];
        unmaximize = [ ];
      };
      "org/gnome/shell/keybindings" = {
        open-application-menu = [ ];
        toggle-message-tray = [ ];
        toggle-overview = [ ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        # Lock screen
        screensaver = [ "<super>l" ];

        # Filemanager
        home = [ "<super>f" ];

        # Thunderbird
        email = [ "<super>m" ];

        # Firefox
        www = [ "<super>b" ];

        # Alacritty
        terminal = [ "<super>t" ];

        # Disable
        rotate-video-lock-static = [ ];
      };
      "org/gnome/mutter" = {
        workspaces-only-on-primary = false;
      };
      "org/gnome/mutter/wayland/keybindings" = {
        # Restore the keyboard shortcuts: disable <super>escape
        restore-shortcuts = [ ];
      };
      "org/gnome/mutter/keybindings" = {
        # Disable tiling to left / right of screen
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };
    };
  };
}
