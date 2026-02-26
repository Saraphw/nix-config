{
  description = "Sarah W's Configuration for NixOS and Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nix-darwin";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let
    username = "kat";
    hostname = "zephyr";
    configuration = {
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
    specialArgs = {
      inherit username hostname;
    };
    #extraSpecialArgs = {
    #  inherit username hostname;
    #};
  in
  {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit specialArgs;
      modules = [ 
        configuration 
        ./modules/users.nix
        ./modules/hosts.nix
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/homebrew.nix
        home-manager.darwinModules.home-manager {
          home-manager = {
            extraSpecialArgs = specialArgs;
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kat = import ./home;
            };
        }
      ];
    };
  };
}
