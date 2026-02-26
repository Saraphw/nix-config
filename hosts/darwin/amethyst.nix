{nixpkgs, nix-darwin, home-manager}: 
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
        
        ../../modules/darwin/nix-det.nix #using determinate nix to manage nix
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
      ];
}

