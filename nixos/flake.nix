{
  description = "Radeox - NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flatpak manager
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    # Manage dotfiles
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secure boot
    lanzaboote = {
      url = "github:Nix-Community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, lanzaboote, nix-flatpak, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        # ----- Legion Nix configuration -----
        Legion-Nix = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./docker
            ./software

            # Nvidia drivers
            ./hardware/nvidia.nix

            # Host specific configuration
            ./hosts/legion.nix
          ];
        };

        # ----- B-Dell Nix configuration -----
        B-Dell = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./docker
            ./software

            # Home Assistant + DuckDNS + Lets encrypt
            ./docker/home-assistant.nix

            # Jellyfin
            ./docker/jellyfin.nix

            # Host specific configuration
            ./hosts/b-dell.nix
          ];
        };
      };
    };
}
