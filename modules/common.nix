flake.nixosModules.common = { pkgs, inputs, ... }: {

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users = {
    what = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "network-manager"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    helix
  ];

};

flake.nixosModule.home-manager = { pkgs, inputs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users = {

  };

};