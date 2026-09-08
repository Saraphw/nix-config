{lib, username, pkgs, nix-vscode-extensions, ...}:
{
  # Setting home-manager specific overlays is not possible with useGlobalPackages.
  # nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];

  imports = [
    ../git.nix
    ../shell.nix
    ../codium.nix
  ];
  home = {
    username = "${username}";
    stateVersion = "25.11";
    packages = with pkgs; [
      firefox-unwrapped
      blender
      unzip
      bitwarden-desktop
      ];
  };
  programs.home-manager.enable = true;
}
