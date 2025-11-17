{ pkgs, ... }: {
  # Install VPN related packages
  environment.systemPackages = with pkgs; [
    openfortivpn
    openvpn
    wireguard-tools
  ];

  # Add OpenVPN plugin to NetworkManager
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openvpn
  ];
}
