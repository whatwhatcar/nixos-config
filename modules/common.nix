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

  #temp

   home-manager = {
      home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
   users = {
     what = import ./home/home.nix
   };

};

flake.nixosModule.home-manager = { pkgs, inputs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users = {

  };

};