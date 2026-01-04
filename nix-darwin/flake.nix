{
  description = "My nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    asmvik-formulae = {
      url = "github:asmvik/homebrew-formulae";
      flake = false;
    };
    FelixKratz-formulae = {
      url = "github:FelixKratz/homebrew-formulae";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      asmvik-formulae,
      FelixKratz-formulae,
      home-manager,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          nixpkgs.config.allowUnfree = true;
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.nixfmt-rfc-style
            pkgs.btop
            pkgs.git
            pkgs.kitty
            pkgs.neovim
            pkgs.tmux
            pkgs.fzf
            pkgs.ripgrep
            pkgs.yazi
            pkgs.lazygit
            pkgs.starship
            pkgs.zoxide
            pkgs.asdf-vm
            pkgs.jq
            pkgs.fd
            pkgs.eza
            pkgs.gh
          ];

          system.primaryUser = "antsajudicael";

          users.users.antsajudicael = {
            shell = pkgs.fish;
          };
          homebrew = {
            enable = true;

            casks = [
              "iina"
              "the-unarchiver"
              "raycast"
              "font-hack-nerd-font"
              "sf-symbols"
            ];
            brews = [
              "yabai"
              "skhd"
              "sketchybar"
            ];
            onActivation.cleanup = "zap";
          };

          # users.users.antsajudicael = {
          #     shell = pkgs.fish;
          # };

          system.defaults = {
            dock.autohide = true;
            dock.persistent-apps = [
              "${pkgs.kitty}/Applications/kitty.app"
              "/Applications/Zen.app"
              "/System/Applications/Music.app"
            ];
            finder._FXSortFoldersFirst = true;
            finder.FXPreferredViewStyle = "clmv";
            finder.ShowPathbar = true;
            trackpad.Clicking = true;
            trackpad.TrackpadRightClick = true;
            loginwindow.GuestEnabled = false;
            # NSGlobalDomain."com.apple.swipescrolldirection" = true;
            NSGlobalDomain._HIHideMenuBar = true;
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain.AppleInterfaceStyle = "Dark";
            WindowManager.StandardHideDesktopIcons = true;
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.fish.enable = true;

          environment.shells = [ pkgs.fish ];
          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mbp
      darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "antsajudicael";

              # Optional: Declarative tap management
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "asmvik/homebrew-formulae" = asmvik-formulae;
                "FelixKratz/homebrew-formulae" = FelixKratz-formulae;
              };

              # Optional: Enable fully-declarative tap management
              #
              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
              mutableTaps = false;
            };
          }
        ];
      };
    };
}
