{ inputs, self, ... }: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self;
      vars = self.vars;
    };

    modules = [
      self.nixosModules.host_laptop
    ];
  };

  flake.nixosModules.host_laptop = { pkgs, ... }: {
    imports = [
      ./_files/hardware-configuration.nix

      inputs.home-manager.nixosModules.home-manager

      self.nixosModules.common
      self.nixosModules.user_what
      
    ];

    networking = {
      hostName = "laptop";
      networkmanager.enable = true;
    };

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    system.stateVersion = "26.05";
  };
}