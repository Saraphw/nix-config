# Got this working thanks to this fellows config: https://github.com/arvigeus/nixos-config/blob/master/apps/vscode.nix
{
  lib,
  pkgs,
  username, 
  hostname, 
  ...
} : 
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    
    mutableExtensionsDir = false;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.nix-vscode-extensions.open-vsx; [
    	  dracula-theme.theme-dracula
	      vscodevim.vim
        jnoortheen.nix-ide
      ] ++ (with pkgs.nix-vscode-extensions.vscode-marketplace; [
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.jupyter-keymap
        ms-python.python
        ms-python.debugpy
      ]);
    };
  };
}
