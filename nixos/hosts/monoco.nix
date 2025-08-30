{ config, lib, modulesPath, ... }: {
  # Hostname
  networking.hostName = "Monoco";

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    # Kernel modules
    kernelModules = [ "amdgpu" "kvm-amd" ];

    initrd = {
      # TPM2
      systemd = {
        enable = true;
        tpm2.enable = true;
      };

      # Kernel modules
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];

      # LUKS Partition
      luks.devices.cryptroot.device = "/dev/disk/by-uuid/b48ae553-49b4-4747-aa00-16b5b15d264d";
    };
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/50D7-A73D";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5acd4081-0cd8-486f-b5f7-70e83e27de57";
    fsType = "btrfs";
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # RTC time standard to localtime (dual boot)
  time.hardwareClockInLocalTime = true;

  # Add OpenRGB service
  services.hardware.openrgb.enable = true;
}
