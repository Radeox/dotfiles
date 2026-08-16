{ pkgs, ... }:
{
  services = {
    # Enable tailscale
    tailscale.enable = true;

    # Enable sunshine
    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  # Install Moonlight
  # environment.systemPackages = with pkgs; [
  #   moonlight-qt
  # ];

  # Tailscale firewall config
  networking.nftables.enable = true;
  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ 41641 ];
  };

  # Force tailscaled to use nftables
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

  # Prevent systemd from waiting for network online
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  # Fix DNS crash after resume
  services.resolved.enable = true;
}
