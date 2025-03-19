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

  # Podman cleaning - Removes every container, image, and volume
  podman-clean = pkgs.writeShellScriptBin "podman-clean" ''
    podman rmi $(podman images -qa) -f
    podman system prune --all --force && podman rmi --all
  '';

  # Retrive the IP address
  myip = pkgs.writeShellScriptBin "myip" ''
    lanIP=$(ip -4 -o -br addr | awk '$0 ~ /^[we]\w+\s+UP\s+/ {str = gsub("/[1-9][0-9]*", "", $0); print $3}')
    wanIP=$(curl -s "ifconfig.me")

    echo "Local IP: $lanIP"
    echo "Public IP: $wanIP"
  '';
in
{
  # Add the scripts to the systemPackages
  environment.systemPackages = [
    activate-venv
    myip
    podman-clean
  ];

  # Add the aliases to the shell
  environment.shellAliases = {
    venv = "source /run/current-system/sw/bin/activate-venv";
  };
}
