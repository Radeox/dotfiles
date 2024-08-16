{ pkgs, ... }: {
  virtualisation = {
    # Podman
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    # Containers config
    containers = {
      enable = true;
    };
  };

  # Podman utils
  environment.systemPackages = with pkgs; [
    podman-compose
    podman-tui
  ];
}
