{pkgs, ...}:{
  services.nginx = {
    enable = true;
    virtualHosts.localhost = {
      locations."/" = {
        return = "200 <html><body>Hello World</body></html>";
        extraConfig = ''
          default_type text/html;
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}