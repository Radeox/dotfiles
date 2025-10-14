{ config, lib, modulesPath, ... }: {
  # Hostname
  networking.hostName = "Legion-Nix";

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    # Kernel modules
    kernelModules = [ "nvidia" ];

    # Add legion module
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];

    initrd = {
      # TPM2
      systemd = {
        enable = true;
        tpm2.enable = true;
      };

      # Kernel modules
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];

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

  fileSystems."/home/radeox/Vault" = {
    device = "/dev/disk/by-uuid/6EF497832FF9AE12";
    fsType = "ntfs";
    options = [ "uid=1000" "gid=100" "dmask=022" "fmask=113" "umask=0022" ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Enable zram swap
  zramSwap.enable = true;
  swapDevices = [ ];

  # Enable TRIM for SSDs
  services.fstrim.enable = lib.mkDefault true;

  # Enables DHCP on each ethernet and wireless interface
  networking.useDHCP = lib.mkDefault true;

  # RTC time standard to localtime (dual boot)
  time.hardwareClockInLocalTime = true;
}
