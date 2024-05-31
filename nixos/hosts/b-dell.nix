{ config, lib, pkgs, modulesPath, ... }:

{
  # Hostname
  networking.hostName = "B-Dell";

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/74AB-F97A";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/50bee516-ebf8-4d48-b708-4f20962b153e";
    fsType = "ext4";
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  swapDevices = [{ device = "/dev/disk/by-uuid/b9b236c3-af64-4d8e-9e03-0cd384fadcec"; }];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Add nvidia vaapi driver
  hardware.opengl.extraPackages = with pkgs; [
    egl-wayland
    libGL
    libglvnd
    libvdpau-va-gl
    vaapiVdpau
  ];
}
