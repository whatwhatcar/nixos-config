flake.nixosModules.common = { pkgs, inputs, ... }: {

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users = {
    what = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    helix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users = {
     what = import ./home/home.nix
    };
  };
}