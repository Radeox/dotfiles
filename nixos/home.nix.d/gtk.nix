{ pkgs, ... }:
let
  catppuccin_name = "Catppuccin-Macchiato-Standard-Green-dark";
  catppuccin = pkgs.catppuccin-gtk.override {
    accents = [ "green" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "macchiato";
  };
in {
  # gtk settings
  gtk = {
    enable = true;
    theme = {
      name = catppuccin_name;
      package = catppuccin;
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source =
    "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/gtk.css";
  home.file.".config/gtk-4.0/gtk-dark.css".source =
    "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/gtk-dark.css";

  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/assets";
  };

  home.sessionVariables.GTK_THEME = "${catppuccin_name}";
}
