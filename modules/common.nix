{
 flake.nixosModules.common = { pkgs, inputs, ... }: {

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ 
   "nix-command" 
   "flakes" 
  ];


  environment.systemPackages = with pkgs; [
    vim
    git
    helix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
 };
}