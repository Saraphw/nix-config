{pkgs, lib, ...} : {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      eval "$(ssh-agent -s)"
      echo "hi kat"
    '';
  };

  home.shellAliases = {
      ll = "ls -lBA";
    };
}