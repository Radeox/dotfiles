# Radeox - Nix #

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:Nix-Community/home-manager/master";
    lanzaboote.url = "github:Nix-Community/lanzaboote";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, lanzaboote, catppuccin, ... }: {
    # --- Radeox-Nix ---
    nixosConfigurations."Legion-Nix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Lanzaboote - Secure boot
        lanzaboote.nixosModules.lanzaboote

        # Catppuccin module
        catppuccin.nixosModules.catppuccin

        # Setup Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.radeox = {
            imports = [
              ./home-manager
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }

        # Cachix setup
        ./cachix.nix

        # My NixOS configuration
        ./environment
        ./hardware
        ./programs
        ./services
        ./users

        # Sunshine streaming server
        ./services/sunshine.nix

        # Host specific configuration
        ./hosts/legion.nix
      ];
    };

    # --- B-Dell ---
    nixosConfigurations."B-Dell" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Lanzaboote - Secure boot
        lanzaboote.nixosModules.lanzaboote

        # Catppuccin module
        catppuccin.nixosModules.catppuccin

        # Setup Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.radeox = {
            imports = [
              ./home-manager
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }

        # Cachix setup
        ./cachix.nix

        # My NixOS configuration
        ./environment
        ./hardware
        ./programs
        ./services
        ./users

        # Host specific configuration
        ./hosts/b-dell.nix
      ];
    };
  };
}
