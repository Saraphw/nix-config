{nixpkgs, } : 
let 
  hostname = "garnet";
  username = "seraph";
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
  ];
}