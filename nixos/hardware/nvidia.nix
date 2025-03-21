{ pkgs, config, ... }: {
  hardware = {
    nvidia = {
      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Power management
      powerManagement.enable = true;

      # Force full composition pipeline
      forceFullCompositionPipeline = false;

      # Open source driver
      open = true;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use lastest drivers
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Nvidia vaapi driver
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
        mesa
        egl-wayland
      ];
    };

    # Nvidia toolkit
    nvidia-container-toolkit.enable = true;
  };

  # Use Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Cuda packages
  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];

  nix.settings = {
    substituters = [ "https://cuda-maintainers.cachix.org" ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };
}
