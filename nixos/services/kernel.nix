{ pkgs, ... }: {
  boot = {
    # Use latest xanmod kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };
}
