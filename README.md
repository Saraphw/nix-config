Hi welcome to my nix setup! 
I am still very new to nix, but I'm trying to get things working. 

Heavily inspired by Ryan Yin's excellent nix-darwin kickstarter: 
https://github.com/ryan4yin/nix-darwin-kickstarter


File structure:
```
home/ # contains home-manager related files
 - darwin/
 - nixos/
 - headless/
hosts/ # specifies a complete host
 - darwin/
 - nixos/
modules/ # contains non-home-manager related nix files
 - core/
 - darwin/
 - nixos/

template/ # not part of OS config: a set of template shell environments for development.
```

Hosts:
 - Amethyst: (darwin) my daily driver mac laptop
 - Diamond: human-facing nix setup
 - Garnet: obsolete
 - Ruby: obsolete

Nix for MacOS configuration:
