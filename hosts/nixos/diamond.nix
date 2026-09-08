{nixpkgs, home-manager, nix-vscode-extensions, ...} : 
let 
  hostname = "diamond";
  username = "natalie";
  configuration = {
    nixpkgs.hostPlatform = "x86_64-linux";
  };
  specialArgs = {
    inherit hostname username nix-vscode-extensions;
  };

in
nixpkgs.lib.nixosSystem {
  inherit specialArgs;
  modules = [
    { nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ]; } #enable globally
    ../../configuration.nix
    ../../modules/core/nix-core.nix
    ../../modules/core/hosts.nix
    ../../modules/nixos/ssh.nix

    home-manager.nixosModules.home-manager {
      home-manager = {
        extraSpecialArgs = specialArgs;
        useGlobalPkgs = true;
        useUserPackages = true;
        users."${username}" = import ../../home/nixos;
      };
    }
  ];
}
