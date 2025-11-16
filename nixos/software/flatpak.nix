{ pkgs, ... }:
{
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
      "com.borgbase.Vorta"
      "com.getpostman.Postman"
      "com.github.tchx84.Flatseal"
      "com.mongodb.Compass"
      "com.spotify.Client"
      "com.valvesoftware.Steam"
      "io.ente.photos"
      "md.obsidian.Obsidian"
      "org.bleachbit.BleachBit"
      "org.ferdium.Ferdium"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.libreoffice.LibreOffice"
      "org.localsend.localsend_app"
      "org.mozilla.Thunderbird"
      "org.qbittorrent.qBittorrent"
      "org.raspberrypi.rpi-imager"
    ];
  };

  environment.shellAliases = {
    gimp = "flatpak run org.gimp.GIMP";
    inkscape = "flatpak run org.inkscape.Inkscape";
    obsidian = "flatpak run md.obsidian.Obsidian";
    zen = "flatpak run app.zen_browser.zen";
  };

  systemd = {
    services.autoFlatpakUpgrade = {
      description = "Automatic Flatpak Upgrade";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = [
          "${pkgs.flatpak}/bin/flatpak"
          "update"
          "-y"
        ];
      };
    };

    timers.autoFlatpakUpgrade = {
      description = "Run Flatpak Upgrade Weekly";
      timerConfig = {
        OnCalendar = "weekly";
        Persistent = true;
      };
      wantedBy = [ "timers.target" ];
    };
  };
}
