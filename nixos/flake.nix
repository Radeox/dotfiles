{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    lanzaboote.url = "github:Nix-Community/lanzaboote";
    home-manager.url = "github:Nix-Community/home-manager/release-23.05";
  };

  outputs = { nixpkgs, lanzaboote, home-manager, ... }: {
    nixosConfigurations."Radeox-Nix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Lanzaboote is a tool to sign NixOS builds for secure boot
        lanzaboote.nixosModules.lanzaboote

        # Home manager is used to generate dotfiles automatically
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.radeox = import ./home.nix;
        }

        # My NixOS configuration
        ./configuration.nix
      ];
    };
  };
}
