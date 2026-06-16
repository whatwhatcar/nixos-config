home-manager: https://github.com/nix-community/home-manager

flake-parts: https://github.com/hercules-ci/flake-parts 

wrapper module: https://github.com/BirdeeHub/nix-wrapper-modules

secret manager: https://github.com/Mic92/sops-nix

disko: https://github.com/nix-community/disko

impermanence: https://github.com/nix-community/impermanence

help: https://github.com/nix-community/awesome-nix 

rice: https://quickshell.org/

/etc/nixos | ~/.config/nixos

nixos-rebuild switch --flake .#username

home-manager switch --flake .#username

example:
https://github.com/ryan4yin/nix-config
https://github.com/Swarsel/.dotfiles

outputs = inputs: import ./outputs inputs;

outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; }
    (inputs.import-tree ./modules);

{ inputs, ... }: {

flake.nixosConfigurations.my-machine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./configuration.nix
    ];
};

put {} around it and special args