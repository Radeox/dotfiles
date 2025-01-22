{ pkgs, ... }: {
  boot = {
    # Use latest stock kernel
    kernelPackages = pkgs.linuxPackages_6_12;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
