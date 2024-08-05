{ ... }: {
  # Enable Docker
  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
    };
  };
}
