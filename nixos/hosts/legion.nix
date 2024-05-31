{ config, lib, modulesPath, pkgs, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Hostname
  networking.hostName = "Radeox-Nix";

  boot = {
    # Kernel modules
    kernelModules = [ "kvm-intel" ];

    # Add legion module
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];

    initrd = {
      # Kernel modules
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" ];
      kernelModules = [ "nvidia" ];

      # LUKS
      luks.devices."luks-fcad8b10-4e2c-4c06-a569-8c173f8bfe96".device = "/dev/disk/by-uuid/fcad8b10-4e2c-4c06-a569-8c173f8bfe96";
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e72d3b8b-21f6-4c6b-8d34-d8c81058c11f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/2B82-40B3";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/home/radeox/Vault" = {
    device = "/dev/disk/by-uuid/380A89A23839E500";
    fsType = "ntfs";
    options = [ "uid=1000" "gid=100" "dmask=022" "fmask=113" "umask=0022" ];
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/7d4d0b1f-fcc1-441e-bea2-b65034dccd38"; }];

  # Enables DHCP on each ethernet and wireless interface
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Setup nvidia
  hardware = {
    nvidia = {
      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Power management
      powerManagement.enable = true;

      # Force full composition pipeline
      forceFullCompositionPipeline = true;

      # Open source driver
      open = false;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use lastest drivers
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    # Add nvidia vaapi driver
    opengl.extraPackages = with pkgs; [
      egl-wayland
      libGL
      libglvnd
      libvdpau-va-gl
      nvidia-vaapi-driver
      vaapiVdpau
    ];
  };

  # Use Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Nvidia env variables
  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";
    VDPAU_DRIVER = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
