{ username, lib, ... }:

{
  # import sub modules
  imports = [
    ./git.nix
    ./shell.nix
    ./programs.nix
  ];

  home = {
    username = username;
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
