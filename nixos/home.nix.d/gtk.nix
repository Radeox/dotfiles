{ pkgs, ... }:
let
  catppuccin_name = "Catppuccin-Mocha-Standard-Lavender-dark";
  catppuccin = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "mocha";
  };
in {
  # GTK settings
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
