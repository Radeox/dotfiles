{ pkgs, ... }: {
  boot = {
    # Use latest xanmod kernel
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_6_10;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
