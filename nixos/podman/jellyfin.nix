{ ... }: {
  virtualisation.oci-containers.containers = {
    # Jellyfin
    jellyfin = {
      image = "jellyfin/jellyfin";

      volumes = [
        "/etc/jellyfin-config:/config"
        "/tmp/jellyfin-cache:/cache"
        "/home/radeox/Storage/Media/:/media:ro"
      ];

      extraOptions = [
        "--network=host"
      ];
    };
  };

  # Periodically update Jellyfin
  systemd = {
    timers.jellyfin-update = {
      wantedBy = [ "timers.target" ];
      partOf = [ "jellyfin-update.service" ];
      timerConfig = {
        OnCalendar = "*-*-* 04:00:00";
        Persistent = true;
      };
    };

    services.jellyfin-update = {
      serviceConfig.Type = "oneshot";
      script = ''
        /run/current-system/sw/bin/podman pull jellyfin/jellyfin
        systemctl restart podman-jellyfin.service

        /run/current-system/sw/bin/podman system prune -f
      '';
    };
  };
}
