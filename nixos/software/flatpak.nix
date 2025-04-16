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
      "app.zen_browser.zen"
      "com.bitwarden.desktop"
      "com.borgbase.Vorta"
      "com.getpostman.Postman"
      "com.github.tchx84.Flatseal"
      "com.heroicgameslauncher.hgl"
      "com.jgraph.drawio.desktop"
      "com.mongodb.Compass"
      "com.spotify.Client"
      "com.valvesoftware.Steam"
      "io.ente.photos"
      "io.github.ungoogled_software.ungoogled_chromium"
      "org.bleachbit.BleachBit"
      "org.deluge_torrent.deluge"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.libreoffice.LibreOffice"
      "org.localsend.localsend_app"
      "org.raspberrypi.rpi-imager"
      "org.telegram.desktop"
    ];
  };

  environment.shellAliases = {
    gimp = "flatpak run org.gimp.GIMP";
    inkscape = "flatpak run org.inkscape.Inkscape";
    zen = "flatpak run app.zen_browser.zen";
  };
}
