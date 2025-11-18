{ pkgs, ... }:
let
  # Python virtual environment
  activate-venv = pkgs.writers.writeFishBin "activate-venv" ''
    if test -f "pyproject.toml"
      echo "Activating virtual environment..."
      uv sync
      source .venv/bin/activate.fish
    else
      echo "Not in a poetry project!"
    end
  '';

  # Docker cleaning - Removes every container, image, and volume
  docker-clean = pkgs.writeShellScriptBin "docker-clean" ''
    docker rmi $(docker images -qa) -f
    docker system prune --all --force && docker rmi --all
  '';

  # Retrive the IP address
  myip = pkgs.writeShellScriptBin "myip" ''
    lanIP=$(ip -4 -o -br addr | awk '$0 ~ /^[we]\w+\s+UP\s+/ {str = gsub("/[1-9][0-9]*", "", $0); print $3}')
    wanIP=$(curl -s "ifconfig.me")

    echo "Local IP: $lanIP"
    echo "Public IP: $wanIP"
  '';

  # Pixel VPN toggle
  pixel-vpn = pkgs.writeShellScriptBin "pixel-vpn" ''
    # Name of the VPN connection
    VPN_NAME="Pixel-VPN"

    # Check if connected
    if nmcli -t -f NAME connection show --active | grep -q "$VPN_NAME"; then
      echo "VPN is active → disconnecting..."
      nmcli connection down "$VPN_NAME"
    else
      echo "VPN is inactive → connecting..."
      nmcli connection up "$VPN_NAME"
    fi
  '';

  # Herolapse VPN toggle
  herolapse-vpn = pkgs.writeShellScriptBin "herolapse-vpn" ''
    # Name of the VPN connection
    VPN_NAME="Herolapse-VPN"

    # Check if connected
    if nmcli -t -f NAME connection show --active | grep -q "$VPN_NAME"; then
      echo "VPN is active → disconnecting..."
      nmcli connection down "$VPN_NAME"
    else
      echo "VPN is inactive → connecting..."
      nmcli connection up "$VPN_NAME"
    fi
  '';
in
{
  # Add the scripts to the systemPackages
  environment.systemPackages = [
    activate-venv
    docker-clean
    herolapse-vpn
    myip
    pixel-vpn
  ];

  # Add the aliases to the shell
  environment.shellAliases = {
    venv = "source /run/current-system/sw/bin/activate-venv";
  };
}
