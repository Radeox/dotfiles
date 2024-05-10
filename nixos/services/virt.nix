{ ... }: {
  # Enable Docker
  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
      liveRestore = false;
    };
  };
}
