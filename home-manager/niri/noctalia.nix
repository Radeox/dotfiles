{ lib, ... }:
{
  programs.noctalia = {
    enable = true;

    settings = lib.mkForce {
      bar = {
        order = [ "Radeox" ];

        Radeox = {
          capsule = true;
          concave_edge_corners = false;
          end = [
            "tray"
            "battery"
            "volume"
            "network"
            "bluetooth"
            "brightness"
            "clipboard"
            "notifications"
            "session"
          ];
          font_family = "JetBrainsMono Nerd Font";
          font_weight = 700;
          margin_edge = 5;
          margin_ends = 15;
          radius = 32;
          shadow = false;
          start = [
            "control-center"
            "launcher"
            "workspaces"
            "media"
          ];
          thickness = 36;
        };
      };

      battery = {
        warning_threshold = 25;

        device = {
          "/org/freedesktop/UPower/devices/battery_hidpp_battery_0" = {
            warning_threshold = 10;
          };
        };
      };

      desktop_widgets = {
        schema_version = 2;
        widget_order = [ ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = { };
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };

          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };

          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };
        };
      };

      location = {
        address = "Fabriano, Italia";
      };

      nightlight = {
        enabled = true;
        temperature_night = 4800;
      };

      caledar = {
        enabled = true;
      };

      plugins = {
        enabled = [ "noctalia/bitwarden" ];
      };

      osd = {
        kinds = {
          lock_keys = false;
        };
      };

      shell = {
        corner_radius_scale = 1.2;
        font_family = "Liberation Sans";
        niri_overview_type_to_launch_enabled = true;
        polkit_agent = true;

        greeter_sync = {
          auto_sync = true;
        };

        animation = {
          speed = 1.2;
        };

        session = {
          actions = [
            {
              action = "shutdown";
              countdown_seconds = 0.0;
              enabled = true;
              shortcut = "1";
              variant = "destructive";
            }
            {
              action = "reboot";
              countdown_seconds = 0.0;
              enabled = true;
              shortcut = "2";
              variant = "default";
            }
            {
              action = "lock_and_suspend";
              countdown_seconds = 0.0;
              enabled = true;
              shortcut = "3";
              variant = "default";
            }
            {
              action = "logout";
              countdown_seconds = 0.0;
              enabled = true;
              shortcut = "4";
              variant = "default";
            }
          ];
        };
      };

      theme = {
        builtin = "Gruvbox";
      };

      widget = {
        battery = {
          hide_when_full = true;
          hide_when_plugged = true;
        };

        clock = {
          format = "{:%H:%M:%S}";
        };

        media = {
          hide_when_no_media = true;
        };

        network = {
          show_label = false;
        };

        tray = {
          drawer = true;
          drawer_columns = 5;
        };

        workspaces = {
          hide_when_empty = true;
          show_labels = false;
        };
      };

      accessibility = {
        ui_scale = 1.1;
      };
    };
  };

  # Ensure Stylix targets Noctalia
  stylix.targets.noctalia.enable = true;
}
