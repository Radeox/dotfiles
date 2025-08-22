{ config, pkgs, ... }: {
  hardware = {
    nvidia = {
      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Power management
      powerManagement.enable = true;

      # Open source driver
      open = true;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use the latest Nvidia driver
      package = config.boot.kernelPackages.nvidiaPackages.beta;

      # Enable PRIME
      prime = {
        reverseSync.enable = true;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
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
}
