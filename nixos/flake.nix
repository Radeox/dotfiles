{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    lanzaboote.url = "github:nix-community/lanzaboote";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, lanzaboote, home-manager, ... }: {
    nixosConfigurations."Radeox-Nix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        lanzaboote.nixosModules.lanzaboote
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.radeox = import ./radeox-home.nix;
        }
        ./configuration.nix
      ];
    };
  };
}
