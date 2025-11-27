{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
    quickemu
  ];

  virtualisation = {
    # Docker config
    docker.enable = true;
    containers.enable = true;
    oci-containers.backend = "docker";

    # Spice USB redirection
    spiceUSBRedirection.enable = true;
  };
}
