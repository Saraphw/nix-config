{nixpkgs, home-manager} : 
let 
  hostname = "ruby";
  username = "username";
  configuration = {
    nixpkgs.hostPlatform = "x86_64-linux";
  };
  specialArgs = {
    inherit hostname username;
  };

in
nixpkgs.lib.nixosSystem {
  inherit specialArgs;
  modules = [
    ../../configuration.nix
    ../../modules/core/nix-core.nix
    ../../modules/core/hosts.nix
    
    ../../modules/nixos/ssh.nix

    {nixpkgs, ...} : {
      services.caddy {
        enable = true;
        
      }
    }
 
    home-manager.nixosModules.home-manager {
      home-manager = {
        extraSpecialArgs = specialArgs;
        useGlobalPkgs = true;
        useUserPackages = true;
        users.seraph = import ../../home/server;
      };
    }
  ];
}