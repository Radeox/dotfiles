{ pkgs, ... }:
{
  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Startup applications
      exec-once = [
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # Input configuration
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";

        # CapsLock to Escape
        kb_options = "caps:escape";

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

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration settings
      decoration = {
        rounding = 16;

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

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Layout settings
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Miscellaneous settings
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = true;
        swallow_regex = "^(ghostty)$";
        vfr = true;
      };

      # XWayland
      xwayland = {
        force_zero_scaling = true;
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

        # Window resizing
        "$mod, bracketleft, resizeactive, -40 0"
        "$mod, bracketright, resizeactive, 40 0"

        # Toggle floating
        "$mod, GRAVE, togglefloating,"

        # Toggle split direction
        "$mod, E, togglesplit,"

        # Exit Hyprland
        "$mod SHIFT, E, exit,"
      ];

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Window rules
      windowrulev2 = [
        # Make all windows start pseudo-tiled (similar to PaperWM behavior)
        # "suppressevent maximize, class:.*"

        # Floating windows
        "float, title:^(Picture-in-Picture)$"
        "float, class:^(org.gnome.Calculator)$"
        "float, class:^(pavucontrol)$"

        # Specific app workspace assignments (optional)
        # "workspace 2, class:^(firefox)$"
        # "workspace 3, class:^(obsidian)$"
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

  # Additional packages needed for Hyprland
  home.packages = with pkgs; [
    cliphist
    dunst
    grim
    grimblast
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsunset
    nwg-displays
    pyprland
    rofi
    slurp
    waybar
  ];

  # Hyprlock configuration
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 0;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };

  # Hypridle configuration
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300; # 5 minutes
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 600; # 10 minutes
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  # HyprPaper configuration
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "/home/radeox/Pictures/Wallpapers/wall12.jpg"
      ];

      wallpaper = [
        ", /home/radeox/Pictures/Wallpapers/wall12.jpg"
      ];
    };
  };

  # Waybar configuration (replaces GNOME top bar)
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "network"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            urgent = "";
            focused = "";
            default = "";
          };
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 50;
          separate-outputs = true;
        };

        clock = {
          format = "{:%H:%M:%S %Y-%m-%d}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          interval = 1;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        network = {
          format-wifi = " {essid}";
          format-ethernet = " {ifname}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}%";
          format-bluetooth-muted = " {icon}";
          format-muted = " {volume}%";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };

        tray = {
          icon-size = 16;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 5px;
        color: #cdd6f4;
        background-color: transparent;
      }

      #workspaces button.active {
        background-color: rgba(137, 180, 250, 0.3);
        color: #89b4fa;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
        color: #1e1e2e;
      }

      #workspaces button:hover {
        background-color: rgba(205, 214, 244, 0.2);
      }

      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #tray {
        padding: 0 10px;
        margin: 0 2px;
        background-color: rgba(30, 30, 46, 0.8);
        color: #cdd6f4;
      }

      #battery.charging {
        color: #a6e3a1;
      }

      #battery.warning:not(.charging) {
        color: #f9e2af;
      }

      #battery.critical:not(.charging) {
        color: #f38ba8;
      }

      #pulseaudio.muted {
        color: #585b70;
      }
    '';
  };

  # Dunst notification daemon configuration (replaces GNOME notifications)
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "10x50";
        origin = "top-right";
        transparency = 10;
        frame_color = "#89b4fa";
        font = "JetBrainsMono Nerd Font 10";
        corner_radius = 4;
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 5;
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#f38ba8";
        timeout = 0;
      };
    };
  };
}
