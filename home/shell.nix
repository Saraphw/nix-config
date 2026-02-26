{pkgs, lib, ...} : {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      echo "hi kat"
    '';
  };

  home.shellAliases = {
      ll = "ls -lBA";
    };
}