{pkgs, ...}:
{

  environment = {
    variables = {
      # Put systemwide environment variables here. 
    };
  };
  time = {
    timeZone = "America/New York";
  };

  system = {
   stateVersion = 7;
   defaults = {
    menuExtraClock.Show24Hour = true;
    screencapture.target = "clipboard";

    dock = {
      autohide = true;
      show-recents = false;
      orientation = "left";

      persistent-apps = null; #todo: use a set to configure dock apps
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;

      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;

      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true; #todo: why does this exist?

      NSTextShowsControlCharacters = true;
    };

    controlcenter = {
      BatteryShowPercentage = true;
      Bluetooth = 18;
      Display = 18;
      Sound = 18;

    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "Nlsv";
      FXRemoveOldTrashItems = true;
      NewWindowTarget = "Home";
      QuitMenuItem = true;
      ShowPathbar = true;
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