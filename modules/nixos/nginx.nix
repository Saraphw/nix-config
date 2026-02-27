{pkgs, ...}:
let website = pkgs.fetchFromGitHub {
  owner = "Saraphw";
  repo = "WWWSeraph";
  rev = "7c1c482ed0b955b164fab244e672ee3d48b5ce46";
  sha256 = "sha256-qd6T/ZynQroIsFUrz/v1cbCaZBQqVl8dbLSgRQd6R+g=";
};
in
{
  services.nginx = {
    enable = true;
    virtualHosts.localhost = {
      root = website;
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}