{nixpkgs, } : 
let 
  hostname = "garnet";
  username = "seraph";
in
nixpkgs.lib.nixosSystem {
  modules = [
    ./configuration.nix
    ../../modules/core/hosts.nix
    
  ]
}