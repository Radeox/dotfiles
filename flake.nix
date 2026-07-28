{
  description = "Radeox - NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Manage dotfiles
    home-manager.url = "github:nix-community/home-manager/master";

    # NixOS hardware configurations
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Flatpak manager
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    # Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri Flake
    niri = {
      # url = "github:sodiboo/niri-flake";
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia Shell
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # Antigravity
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Monique
    monique = {
      url = "github:ToRvaLDz/monique";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Pixel Access - Custom app
    pixel-access.url = "path:/home/radeox/Sources/Pixel/pixel-access-nix";
  };

  outputs =
    inputs@{ nixpkgs
    , home-manager
    , lanzaboote
    , nix-flatpak
    , nixos-hardware
    , stylix
    , noctalia
    , niri
    , antigravity-nix
    , monique
    , ...
    }:
    {
      nixosConfigurations = {
        # ----- Legion Nix configuration -----
        Legion-Nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # NixOS hardware config for Lenovo Legion 5
            nixos-hardware.nixosModules.lenovo-legion-16iah7h

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Stylix - Theme manager
            stylix.nixosModules.stylix

            # Home Manager - Manage dotfiles
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.radeox = {
                imports = [
                  stylix.homeModules.stylix
                  noctalia.homeModules.default
                  inputs.niri.homeModules.niri
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./software
            ./system

            # Host specific configuration
            ./hosts/legion.nix
          ];
        };

        # ----- Monoco configuration -----
        Monoco = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Stylix - Theme manager
            stylix.nixosModules.stylix

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.radeox = {
                imports = [
                  stylix.homeModules.stylix
                  noctalia.homeModules.default
                  inputs.niri.homeModules.niri
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./software
            ./system

            # Host specific configuration
            ./hosts/monoco.nix
          ];
        };
      };
    };
}
