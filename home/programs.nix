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
    enable = true;
    package = pkgs.vscodium;
  };

  # For automatic nix develop of environments in shell
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}