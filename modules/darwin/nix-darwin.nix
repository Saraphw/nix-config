{pkgs, lib, ...} : 

{
  nix = {
    enable = true;
    settings = {
	    experimental-features = [ "nix-command" "flakes" ""];
	  };
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
    };
    #linux-builder.enable = true;
  };
}
