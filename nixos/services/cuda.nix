{ pkgs, ... }: {
  # Cuda packages
  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];

  # Nvidia toolkit
  hardware.nvidia-container-toolkit.enable = true;
}
