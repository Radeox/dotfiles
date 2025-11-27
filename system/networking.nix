{ ... }:
{
  networking = {
    # Enable network manager
    networkmanager.enable = true;

    # Firewall configuration
    firewall = {
      enable = true;

      # Dev ports = 8080 8082 9080
      # LocalSend = 53317
      allowedTCPPorts = [
        8080
        8082
        9080
        53317
      ];
      allowedUDPPorts = [ 53317 ];

      # KDE Connect
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };
}
