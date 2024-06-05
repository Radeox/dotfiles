{ pkgs, lib, ... }: {
  # Catppuccin theme
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "green";
  };

  # Cattpuccin GTK
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    # Catppuccin cursor
    cursorTheme = {
      name = lib.mkForce "Catppuccin-Mocha-Green";
      package = lib.mkForce pkgs.catppuccin-cursors.mochaGreen;
    };

    catppuccin = {
      enable = true;

      flavor = "mocha";
      accent = "green";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };

  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];
}
