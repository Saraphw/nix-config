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
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let 
    amethyst = import ./hosts/darwin/amethyst.nix {
      inherit nixpkgs nix-darwin home-manager;
      };
    garnet = import ./hosts/nixos/garnet.nix {
      inherit nixpkgs home-manager;
    };
  in
  {
    darwinConfigurations = {
      inherit amethyst;
    };
    nixosConfigurations = {
      inherit garnet;
    };
  };
}
