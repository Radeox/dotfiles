{ pkgs, config, lib, modulesPath, ... }:

{
  # Hostname
  networking.hostName = "B-Dell";

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    initrd = {
      # TPM2
      systemd = {
        enable = true;
        enableTpm2 = true;
      };

      # LUKS2
      luks.devices.cryptroot.device = "/dev/disk/by-uuid/c24c7c1c-87cf-453d-b4d1-8b78d0164d5d";

      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/ECA2-CE6F";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/affbc5cc-f52b-4729-b411-b9fdeca9d001";
    fsType = "ext4";
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/a1cdc93e-c7f5-49eb-94ce-20168fb08297"; }];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Add vaapi driver
  hardware.graphics.extraPackages = with pkgs; [
    intel-vaapi-driver
    libvdpau-va-gl
    vaapiVdpau
  ];

  # SSH server
  services.openssh = {
    enable = true;
    ports = [ 2222 ];

    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "radeox" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  # Turn off firewall
  networking.firewall.enable = lib.mkForce false;
}
