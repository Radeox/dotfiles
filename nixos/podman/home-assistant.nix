{ ... }: {
  # Home-assistant
  virtualisation.oci-containers = {
    backend = "podman";

    containers.homeassistant = {
      image = "ghcr.io/home-assistant/home-assistant:stable";

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
}
