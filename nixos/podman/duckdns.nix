{ ... }: {
  virtualisation.oci-containers.containers = {
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
  };
}
