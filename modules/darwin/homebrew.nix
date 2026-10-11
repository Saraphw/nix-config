/**
  Note! You have to install homebrew seperately
  once you do, you never have to run a homebrew command
  again though. Just darwin-rebuild. 

  This config will destroy any packages installed seperately
  by homebrew. To change this behaviour, set homebrew.onActivation.cleanup = "none". 
 */
{ lib, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    masApps = {
    };

    brews = [

    ];

    casks = [
      "element"
      "signal"
      "vscodium"
      "wireshark-app"
      "jupyterlab-app"
      "super-productivity"
      "obsidian"
      "microsoft-teams"
    ];
    # TODO: one master list of extensions which applies to both
    # nixos managed vscodium and homebrew installed vscodium
    vscode = [
      "vscodevim.vim"
      "jnoortheen.nix-ide"
      "ms-toolsai.jupyter"
      "ms-toolsai.jupyter-renderers"
      "ms-toolsai.vscode-jupyter-cell-tags"
      "ms-toolsai.jupyter-keymap"
      "ms-python.python"
      "ms-python.debugpy"
      "llvm-vs-code-extensions.vscode-clangd"
    ];
  };
}
