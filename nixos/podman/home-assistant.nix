{ ... }: {
  virtualisation.oci-containers.containers = {
    # Home-assistant
    homeassistant = {
      image = "docker.io/homeassistant/home-assistant:latest";

      volumes = [
        "/etc/home-assistant-data:/config"
        "/etc/localtime:/etc/localtime:ro"
        "/run/dbus:/run/dbus:ro"
      ];

      environment.TZ = "Europe/Rome";
      extraOptions = [
        "--network=host"
      ];
    };
  };

  # DuckDNS
  duckdns = {
    image = "lscr.io/linuxserver/duckdns:latest";
    autoStart = true;

    environmentFiles = [
      "/etc/duckdns/.env"
    ];

    extraOptions = [
      "--network=host"
    ];
  };

  # Lets encrypt 
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;

    virtualHosts."sblumbo.duckdns.org" = {
      forceSSL = true;
      enableACME = true;

      extraConfig = ''
        proxy_buffering off;
      '';

      locations."/" = {
        proxyPass = "http://[::1]:8123";
        proxyWebsockets = true;
      };
    };
  };

  # ACME
  security.acme = {
    acceptTerms = true;
    defaults.email = "dawid.weglarz95@gmail.com";
  };

  # Periodically update HomeAssistant + DuckDNS
  systemd = {
    timers.home-assistant-update = {
      wantedBy = [ "timers.target" ];
      partOf = [ "home-assistant-update.service" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    services.home-assistant-update = {
      serviceConfig.Type = "oneshot";
      script = ''
        /run/current-system/sw/bin/podman pull docker.io/homeassistant/home-assistant:latest
        systemctl restart podman-homeassistant.service

        /run/current-system/sw/bin/podman pull lscr.io/linuxserver/duckdns:latest
        systemctl restart podman-duckdns.service

        /run/current-system/sw/bin/podman system prune -f
      '';
    };
  };
}
