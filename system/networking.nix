{ pkgs, ... }:
{
  networking = {
    networkmanager = {
      # Enable network manager
      enable = true;

      # Add OpenVPN plugin to NetworkManager
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };

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
    };
  };
}
