{nixpkgs, home-manager} : 
let 
  hostname = "diamond";
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

    home-manager.nixosModules.home-manager {
      home-manager = {
        extraSpecialArgs = specialArgs;
        useGlobalPkgs = true;
        useUserPackages = true;
        users.seraph = import ../../home/nixos;
      };
    }
  ];
}