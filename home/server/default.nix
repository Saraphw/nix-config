{lib, username, ...}:
{
  imports = [
    ../git.nix
    ../shell.nix
  ];
  home = {
    username = username;
  };
  programs.home-manager.enable = true;
}