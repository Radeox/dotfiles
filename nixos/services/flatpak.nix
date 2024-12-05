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
      "com.github.tchx84.Flatseal"
      "com.spotify.Client"
      "io.github.hmlendea.geforcenow-electron"
      "org.bleachbit.BleachBit"
      "org.deluge_torrent.deluge"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.libreoffice.LibreOffice"
      "org.localsend.localsend_app"
      "org.telegram.desktop"
    ];
  };
}
