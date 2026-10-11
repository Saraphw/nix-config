{pkgs, ...} : 
{
  home.packages = with pkgs; [
    p7zip
    cowsay
    qbittorrent
    openvpn
    firefox-unwrapped
    vlc-bin
    python315
    bitwarden-desktop
    hello
    libreoffice-bin
    #claude-code

  ];

  programs.vscode = {
    profiles = {
      default = {
        userSettings = {

        };
      };
    };
    enable = false;
    #package = pkgs.vscodium;
  };

  # For automatic nix develop of environments in shell
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
