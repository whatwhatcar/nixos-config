{
 flake.nixosModulez.user_what = { pkgs, ... }: {
  users.user.what = { 
   isNormalUser = true;
   
   extraGroups = [ 
    "wheel"
    "networkmanager"
   ];

   #home-manager.users.what = import ./home/home.nix
  };
 };
}
