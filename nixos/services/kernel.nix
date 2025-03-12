{ pkgs, ... }: {
  boot = {
    # Use latest stock kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
