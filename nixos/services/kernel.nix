{ pkgs, ... }: {
  boot = {
    # Use latest xanmod kernel
    kernelPackages = pkgs.linuxPackages_latest;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
