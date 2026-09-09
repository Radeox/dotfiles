{ config, pkgs, ... }:
{
  programs.niri = {
    enable = true;

    settings = {
      includes = [
        { path = "monitors.kdl"; optional = true; }
      ];

      input = {
        keyboard.xkb.layout = "us,it";
        keyboard.xkb.options = "caps:escape";
        keyboard.numlock = true;

        touchpad = {
          tap = true;
          dwt = true;
          natural-scroll = false;
        };

        mouse.accel-speed = 0.0;
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };
      };

      layout = {
        gaps = 14;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 1.0 / 3.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 2.0 / 3.0; }
        ];

        default-column-width = {
          proportion = 1.0;
        };

        focus-ring = {
          enable = true;
          width = 2;
          active.color = "#${config.lib.stylix.colors.base0D}";
          inactive.color = "#${config.lib.stylix.colors.base03}";
        };
      };

      cursor = {
        hide-when-typing = true;
        hide-after-inactive-ms = 1000;
      };

      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];

      binds = {
        # Launchers
        "Mod+T".action.spawn = "ghostty";
        "Mod+H".action.spawn = "obsidian";
        "Mod+M".action.spawn = "thunderbird";
        "Mod+J".action.spawn = "Telegram";
        "Mod+N".action.spawn = "spotify";
        "Mod+Y".action.spawn = "nautilus";
        "Mod+B".action.spawn = "zen-beta";

        # Close window
        "Mod+Q".action.close-window = { };

        # Fullscreen / Maximize
        "Mod+F".action.maximize-column = { };
        "Mod+Shift+F".action.fullscreen-window = { };

        # Toggle overview
        "Mod+D".action.toggle-overview = { };

        # App launcher (Noctalia)
        "Mod+Space".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];

        # Lock screen (Noctalia)
        "Mod+L".action.spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];

        # Screenshots
        "Mod+Shift+S".action.spawn = [
          "noctalia"
          "msg"
          "screenshot-region"
        ];

        "Print".action.spawn = [
          "noctalia"
          "msg"
          "screenshot-fullscreen"
        ];

        # Clipboard history
        "Mod+V".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "clipboard"
        ];

        # Color picker
        "Mod+Shift+C".action.spawn = [
          "hyprpicker"
          "-a"
        ];

        # Focus movement
        "Mod+Left".action.focus-column-left = { };
        "Mod+Right".action.focus-column-right = { };
        "Mod+Up".action.focus-window-or-workspace-up = { };
        "Mod+Down".action.focus-window-or-workspace-down = { };

        # Move windows
        "Mod+Shift+Left".action.move-column-left-or-to-monitor-left = { };
        "Mod+Shift+Right".action.move-column-right-or-to-monitor-right = { };
        "Mod+Shift+Up".action.move-window-up-or-to-workspace-up = { };
        "Mod+Shift+Down".action.move-window-down-or-to-workspace-down = { };

        # Move between monitors
        "Mod+Ctrl+Left".action.focus-monitor-left = { };
        "Mod+Ctrl+Right".action.focus-monitor-right = { };
        "Mod+Ctrl+Up".action.focus-monitor-up = { };
        "Mod+Ctrl+Down".action.focus-monitor-down = { };

        # Switch workspaces
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;

        # Move active window to a workspace
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;

        # Scroll workspaces
        "Mod+WheelScrollDown".action.focus-workspace-down = { };
        "Mod+WheelScrollUp".action.focus-workspace-up = { };

        # Toggle floating
        "Mod+Grave".action.toggle-window-floating = { };

        # Switch keyboard layout
        "Alt+Space".action.switch-layout = "next";

        # Cycle between width presets
        "Mod+R".action.switch-preset-window-width = { };

        # Power menu (Noctalia)
        "Mod+Shift+E".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "session"
        ];

        # Audio
        "XF86AudioRaiseVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%+"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%-"
        ];
        "XF86AudioMute".action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];

        # Media
        "XF86AudioPlay".action.spawn = [
          "playerctl"
          "--ignore-player=Valent"
          "play-pause"
        ];
        "XF86AudioNext".action.spawn = [
          "playerctl"
          "--ignore-player=Valent"
          "next"
        ];
        "XF86AudioPrev".action.spawn = [
          "playerctl"
          "--ignore-player=Valent"
          "previous"
        ];
        "XF86AudioStop".action.spawn = [
          "playerctl"
          "--ignore-player=Valent"
          "stop"
        ];

        # Brightness
        "XF86MonBrightnessUp".action.spawn = [
          "brightnessctl"
          "set"
          "+10%"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "brightnessctl"
          "set"
          "10%-"
        ];

        # Calculator
        "XF86Calculator".action.spawn = "gnome-calculator";

        # Resizing
        "Mod+BracketLeft".action.set-column-width = "-10%";
        "Mod+BracketRight".action.set-column-width = "+10%";
      };

      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };

          clip-to-geometry = true;
        }
        {
          matches = [{ title = "^Picture-in-Picture$"; }];
          open-floating = true;
        }
        {
          matches = [{ app-id = "org.gnome.Calculator"; }];
          open-floating = true;
        }
      ];

      # Disable hot corners
      gestures = {
        hot-corners.enable = false;
      };

      # Extra
      hotkey-overlay.skip-at-startup = true;
    };
  };

  home.packages = [
    pkgs.playerctl
  ];

}
