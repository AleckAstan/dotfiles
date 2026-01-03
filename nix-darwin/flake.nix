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
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask}:
  let
    configuration = { pkgs, ... }: {
	    nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
	      [ 
	      pkgs.btop
	      pkgs.git
	      pkgs.kitty
	      pkgs.neovim
	      pkgs.tmux
	      pkgs.fzf
	      pkgs.ripgrep
	      pkgs.yazi
	      ];


system.primaryUser = "antsajudicael";

homebrew = {
  enable = true;

  casks = [
    "iina"
    "the-unarchiver"
  ];
  onActivation.cleanup = "zap";
};

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

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
					  };

# Optional: Enable fully-declarative tap management
#
# With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
					  mutableTaps = false;
				  };
			  }		  ];
	  };
  };
}
