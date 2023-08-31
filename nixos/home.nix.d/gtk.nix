{ pkgs, ... }: {
  # GTK theme
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "standard";
        variant = "frappe";
      };
    };
  };
}
