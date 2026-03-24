{lib, username, ...}:
{
  imports = [
    ../git.nix
    ../shell.nix
    ../darwin/programs.nix
  ];
  home = {
    username = username;
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;
}