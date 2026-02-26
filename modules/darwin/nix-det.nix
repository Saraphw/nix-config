{pkgs, lib, ...} : 
# Determinate nix wants to be special and manage nix all on its own so we don't do it here. 
{
  nix = {
    enable = false; 
  };

}