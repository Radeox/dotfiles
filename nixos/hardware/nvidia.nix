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
      open = false;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use lastest drivers
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    # Nvidia toolkit
    nvidia-container-toolkit.enable = true;

    # Nvidia vaapi driver
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    };
  };

  # Use Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Cuda packages
  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];
}
