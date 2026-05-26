{
description  = "flake";

  inputs = { 
  nixpkgs.url = "gitub:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ { nixpkgs, ... }:
}
