{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;

      # Enable Gnome
      desktopManager.gnome.enable = true;

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
  };
}
