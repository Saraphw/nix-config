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

    # Tool for building x86_64-linux and aarch64-linux on aarch64-darwin machine
    # depends on having rosetta installed `softwareupdate --install-rosetta`
    nix-rosetta-builder = {
      url = "github:cpick/nix-rosetta-builder";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-rosetta-builder}:
  let 
    amethyst = import ./hosts/darwin/amethyst.nix {
      inherit nixpkgs nix-darwin home-manager nix-rosetta-builder;
      };
    garnet = import ./hosts/nixos/garnet.nix {
      inherit nixpkgs home-manager;
    };
    ruby = import ./hosts/nixos/ruby.nix {
      inherit nixpkgs home-manager;
    };
  in
  {
    darwinConfigurations = {
      inherit amethyst;
    };
    nixosConfigurations = {
      inherit garnet ruby;

      iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        #specialArgs = {inherit nixpkgs;};
        modules = [
          ({ pkgs, modulesPath, ... }: {
            imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
            environment.systemPackages = [ pkgs.neovim ];
          })
        ];
      };
    };
  };
}


