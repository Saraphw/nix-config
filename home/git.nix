{
  lib,
  username, 
  hostname, 
  ...
} : 
{

    # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;

    settings = {
      user.email = "${username}@${hostname}";
      user.name = "${username}";

      pull.rebase = true;
      init.defaultBranch = "main";

    };
  };
}