{ ... }: {
  services.flatpak = {
    enable = true;

    # Auto-update
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };

    # Packages list
    packages = [
      "com.bitwarden.desktop"
      "com.borgbase.Vorta"
      "com.github.tchx84.Flatseal"
      "io.ente.auth"
      "io.github.hmlendea.geforcenow-electron"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.localsend.localsend_app"
    ];
  };
}
