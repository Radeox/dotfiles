{ ... }:
{
  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Startup applications
      exec-once = [
        "swww-daemon &"
        "hyprctl setcursor Qogir-Manjaro-Dark 28"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # Input configuration
      input = {
        kb_layout = "us,it";
        kb_variant = "";
        kb_model = "";

        # CapsLock to Escape
        kb_options = "caps:escape";

        # Enable NumLock by default
        numlock_by_default = true;

        # Focus follows mouse
        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
          tap-to-click = true;
          disable_while_typing = true;
        };

        sensitivity = 0;
      };

      # General window and workspace settings
      general = {
        gaps_in = 8;
        gaps_out = 12;
        border_size = 2;

        "col.active_border" = "rgba(a7c080ee) rgba(dbbc7fee) 45deg";
        "col.inactive_border" = "rgba(4b565cee)";

        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration settings
      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Animation settings
      animations = {
        enabled = true;

        bezier = "slideCurve, 0.05, 0.9, 0.1, 1.0";

        animation = [
          "windows, 1, 7, slideCurve"
          "windowsOut, 1, 7, default, slide right"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Layout settings
      dwindle = {
        pseudotile = true;
        force_split = 2;
      };

      # Miscellaneous settings
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = true;
        swallow_regex = "^(com.mitchellh.ghostty)$";
        vfr = true;
      };

      # Cursor settings
      cursor = {
        no_hardware_cursors = false;

        # Cursor auto-hide after inactivity
        inactive_timeout = 3;
      };

      # Hide unnecessary nags
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      # Variables
      "$mod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$browser" = "flatpak run app.zen_browser.zen";
      "$obsidian" = "flatpak run md.obsidian.Obsidian";
      "$ferdium" = "flatpak run org.ferdium.Ferdium";
      "$mail" = "flatpak run org.mozilla.Thunderbird";
      "$spotify" = "flatpak run com.spotify.Client";
      "$menu" = "rofi -show drun";
      "$windowSwitcher" = "rofi -show window";
      "$powerMenu" = "rofi -show power-menu";
      "$volumeUp" = "hyprpanel vol +5";
      "$volumeDown" = "hyprpanel vol -5";
      "$brightnessUp" = "brightnessctl set +10%";
      "$brightnessDown" = "brightnessctl set 10%-";

      # Key bindings
      bind = [
        # Launchers
        "$mod, T, exec, $terminal"
        "$mod, H, exec, $obsidian"
        "$mod, M, exec, $mail"
        "$mod, J, exec, $ferdium"
        "$mod, N, exec, $spotify"
        "$mod, Y, exec, $fileManager"
        "$mod, B, exec, $browser"

        # Close window
        "$mod, Q, killactive,"

        # Toggle fullscreen
        "$mod, F, fullscreen, 0"

        # App launcher
        "$mod, SPACE, exec, $menu"

        # Lock screen
        "$mod, L, exec, hyprlock"

        # Screenshots
        "$mod SHIFT, S, exec, grimblast copy area" # Screenshot selection
        ", PRINT, exec, grimblast copy screen" # Full screenshot

        # Clipboard history
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Color picker
        "$mod SHIFT, C, exec, hyprpicker -a"

        # Focus movement
        "$mod, LEFT, movefocus, l"
        "$mod, RIGHT, movefocus, r"
        "$mod, UP, movefocus, u"
        "$mod, DOWN, movefocus, d"

        # Move windows
        "$mod SHIFT, LEFT, movewindow, l"
        "$mod SHIFT, RIGHT, movewindow, r"
        "$mod SHIFT, UP, movewindow, u"
        "$mod SHIFT, DOWN, movewindow, d"

        # Switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scratchpad
        "$mod, ESCAPE, togglespecialworkspace, scratch"
        "$mod SHIFT, ESCAPE, movetoworkspace, special:scratch"

        # Toggle floating
        "$mod, GRAVE, togglefloating,"

        # Toggle split direction
        "$mod, E, togglesplit,"

        # Application switching
        "ALT, Tab, exec, $windowSwitcher"
        # Switch keyboard layout
        "ALT, SPACE, exec, hyprctl switchxkblayout next"

        # Rofi power menu
        "$mod SHIFT, E, exec, $powerMenu"
      ];

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Special bindings
      binde = [
        # Volume control
        ", XF86AudioRaiseVolume, exec, $volumeUp"
        ", XF86AudioLowerVolume, exec, $volumeDown"

        # Brightness control
        ", XF86MonBrightnessUp, exec, $brightnessUp"
        ", XF86MonBrightnessDown, exec, $brightnessDown"

        # Window resizing
        "$mod, bracketleft, resizeactive, -40 0"
        "$mod, bracketright, resizeactive, 40 0"
      ];

      gestures = {
        # Swipe between workspaces
        gesture = "3, horizontal, workspace";
      };

      # Window rules
      windowrulev2 = [
        # Floating windows
        "float, title:^(Picture-in-Picture)$"
        "float, class:^(org.gnome.Calculator)$"
        "float, class:^(org.pulseaudio.pavucontrol)$"
        "float, class:^(.blueman-manager-wrapped)$"
      ];

      # Monitor configuration
      monitor = [
        ",preferred,auto,1"
      ];
    };

    # Monitor configuration from nwg-displays
    extraConfig = ''
      # Load monitor configuration generated by nwg-displays
      source = ~/.config/hypr/monitors.conf
    '';
  };
}
