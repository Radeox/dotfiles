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
      "com.getpostman.Postman"
      "com.github.tchx84.Flatseal"
      "com.heroicgameslauncher.hgl"
      "com.spotify.Client"
      "com.valvesoftware.Steam"
      "io.ente.photos"
      "org.bleachbit.BleachBit"
      "org.deluge_torrent.deluge"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.libreoffice.LibreOffice"
      "org.localsend.localsend_app"
      "org.telegram.desktop"
    ];
  };

  environment.shellAliases = {
    gimp = "flatpak run org.gimp.GIMP";
  };
}
