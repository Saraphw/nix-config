{pkgs, lib, ...} : 
{
  nix = {
    enable = false; # Due to using determinate nix
    #the rest of this doesn't really matter because it's off
    #taken from examples/rich-demo
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
# doesn't work with nix.enable = false;
#    gc = {
#      automatic = lib.mkDefault true;
#      options = lib.mkDefault "--delete-older-than 7d";
#    };
  };

}