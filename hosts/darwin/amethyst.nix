{nixpkgs, nix-darwin, home-manager, nix-rosetta-builder, ...}: 
  let 
  hostname = "amethyst";
  username = "kat";
  configuration = {
    nixpkgs.hostPlatform = "aarch64-darwin";
  };
  specialArgs = {
    inherit hostname username;
  };
  in
  nix-darwin.lib.darwinSystem {
      inherit specialArgs;
      modules = [ 
        configuration
        ../../modules/core/hosts.nix
        
        ../../modules/darwin/nix-darwin.nix
        ../../modules/darwin/system.nix
        ../../modules/darwin/homebrew.nix
        ../../modules/darwin/users.nix

        home-manager.darwinModules.home-manager {
          home-manager = {
            extraSpecialArgs = specialArgs;
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kat = import ../../.../../home/darwin;
            };
        }
        nix-rosetta-builder.darwinModules.default {
          nix-rosetta-builder.onDemand = true;
        }
      ];
}

