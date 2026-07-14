{ pkgs, lib, config, ... }:
{
  # Enable Niri
  programs.niri.enable = true;

  # ReGreet for login
  programs.regreet = {
    enable = true;

    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  # Custom greetd session using Sway to mirror displays
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --unsupported-gpu --config ${pkgs.writeText "greetd-sway-config" ''
          # Disable borders
          default_border none
          default_floating_border none

          # Keyboard layout settings
          input * {
            xkb_layout "us,it"
            xkb_options "caps:escape"
          }

          # Position all outputs at 0,0 to duplicate/mirror the display space
          output * pos 0 0

          # Start ReGreet and exit Sway when ReGreet exits (i.e. on login)
          exec "${config.programs.regreet.package}/bin/regreet; ${pkgs.sway}/bin/swaymsg exit"
        ''}";
        user = "greeter";
      };
    };
  };

  # Disable stylix for ReGreet
  stylix.targets.regreet.enable = false;

  # Enable dconf for GTK settings
  programs.dconf.enable = true;

  # XDG Desktop Portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };

      gamescope = {
        default = [ "gtk" ];
      };

      niri = {
        default = lib.mkForce [
          "wlr"
          "gtk"
        ];
      };
    };
  };
}
