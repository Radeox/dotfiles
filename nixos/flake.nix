{
  description = "Radeox - NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Nixpkgs - unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flatpak manager
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    # Manage dotfiles
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secure boot
    lanzaboote = {
      url = "github:Nix-Community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, lanzaboote, nix-flatpak, ... }:
    let
      system = "x86_64-linux";

      # Unstable branch of nixpkgs
      pkgs-unstable = import nixpkgs-unstable { system = "x86_64-linux"; config.allowUnfree = true; };
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
              home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./podman
            ./software

            # Nvidia drivers
            ./hardware/nvidia.nix

            # Ollama
            ./podman/ollama.nix

            # Host specific configuration
            ./hosts/legion.nix
          ];

          specialArgs = {
            inherit pkgs-unstable;
          };
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
              home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./podman
            ./software

            # Home Assistant + DuckDNS + Lets encrypt
            ./podman/home-assistant.nix

            # Host specific configuration
            ./hosts/b-dell.nix
          ];

          specialArgs = {
            inherit pkgs-unstable;
          };
        };
      };
    };
}
