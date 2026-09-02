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

  # For automatic nix develop of environments in shell
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
