{nixpkgs, } : 
let 
  hostname = "garnet";
  username = "seraph";
  configuration = {
    nixpkgs.hostPlatform = "x86_64-linux";
  };
in
nixpkgs.lib.nixosSystem {
  modules = [
    ../../configuration.nix
    ../../modules/core/nix-core.nix
  ];
}