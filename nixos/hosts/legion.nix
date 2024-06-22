{ config, lib, modulesPath, pkgs, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Hostname
  networking.hostName = "Legion-Nix";

  boot = {
    # Kernel modules
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "nvidia_drm.fbdev=1" ];

    # Add legion module
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];

    initrd = {
      # TPM2
      systemd = {
        enable = true;
        enableTpm2 = true;
      };

      # Kernel modules
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ "nvidia" ];

      # LUKS Partition
      luks.devices."luks-69acb90d-0127-4ce8-a157-a8abb1fe7ed3".device = "/dev/disk/by-uuid/69acb90d-0127-4ce8-a157-a8abb1fe7ed3";
    };
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8D2A-3CC3";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/15e389cf-cb14-4e88-baa8-5bfe2de490ee";
    fsType = "ext4";
  };

  # fileSystems."/home/radeox/Vault" = {
  #   device = "/dev/disk/by-uuid/380A89A23839E500";
  #   fsType = "ntfs";
  #   options = [ "uid=1000" "gid=100" "dmask=022" "fmask=113" "umask=0022" ];
  # };

  # swapDevices = [{ device = "/dev/disk/by-uuid/7d4d0b1f-fcc1-441e-bea2-b65034dccd38"; }];
  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Use Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Setup nvidia
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
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    # Add nvidia vaapi driver
    graphics.extraPackages = with pkgs; [
      libvdpau-va-gl
      nvidia-vaapi-driver
      vaapiVdpau
    ];
  };
}
