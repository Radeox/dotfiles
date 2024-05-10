{ pkgs, ... }: {
  services.xserver = {
    # Enable xserver
    enable = true;

    # Enable GDM
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };

    # Remove xterm from the default packages
    excludePackages = [ pkgs.xterm ];
  };

  # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
