{ pkgs, ... }: {
  boot = {
    # Use latest stock kernel
    # kernelPackages = pkgs.linuxPackages_latest;

    # Use latest xanmod kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
