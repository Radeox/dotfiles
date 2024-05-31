{ pkgs, ... }: {
  # Catppuccin theme
  catppuccin = {
    enable = true;

    # Flavour
    flavor = "mocha";
    accent = "green";
  };

  # Cattpuccin GTK
  gtk = {
    enable = true;

    catppuccin = {
      enable = true;

      flavor = "mocha";
      accent = "green";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };

  # Catppuccin cursor
  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Green-Cursors";
    package = pkgs.catppuccin-cursors.mochaGreen;
    size = 22;
  };
}
