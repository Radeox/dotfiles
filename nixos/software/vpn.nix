{ pkgs, ... }: {
  # Install VPN related packages
  environment.systemPackages = with pkgs; [
    openvpn
    wireguard-tools
  ];

  # Add OpenVPN plugin to NetworkManager
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openvpn
  ];
}
