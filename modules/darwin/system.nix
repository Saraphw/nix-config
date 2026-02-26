{pkgs, ...}:
{

  environment = {
    variables = {
      # Put systemwide environment variables here. 
    };
  };

  system = {
#   configurationRevision = self.rev or self.dirtyRev or null;
   stateVersion = 6;
   defaults = {
    menuExtraClock.Show24Hour = false;

    dock = {
      autohide = true;
      show-recents = false;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";

      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
    };

    CustomUserPreferences = {
      "com.apple.finder" = {
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
      };
    };
   };
  };
}