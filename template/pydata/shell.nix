# Customized from  Michał Mieszczak's template: https://github.com/LongerHV/nixos-configuration/tree/master/templates
{ pkgs, lib, stdenv, ... }:

let
  pythonPackages = pkgs.python3Packages;
in
pkgs.mkShell {
  buildInputs = [
    pythonPackages.python
    pythonPackages.venvShellHook
    pythonPackages.jupyter
    pythonPackages.ipykernel
    pythonPackages.ipython
  ];
  venvDir = "./.venv";
  postVenvCreation = ''
    unset SOURCE_DATE_EPOCH
    python -m ipykernel install --user --name=.venv
  '';
  postShellHook = ''
    unset SOURCE_DATE_EPOCH
    export LD_LIBRARY_PATH=${lib.makeLibraryPath [stdenv.cc.cc]}

    if [[ ! -f "requirements.txt" ]]; then
      cat > requirements.txt << EOF
numpy
pandas
matplotlib
EOF
    fi
    
  '';
}