# flake.nix
{
  description = "Nebula Hypr Desktop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosModules = {
      nebula = import ./modules/nebula.nix;
      nebula-cmatrix = import ./modules/cmatrix.nix;
      nebula-cowsay = import ./modules/cowsay.nix;
    };

    homeManagerModules = {
      nebula = import ./modules/nebula.nix;
      nebula-cmatrix = import ./modules/cmatrix.nix;
      nebula-cowsay = import ./modules/cowsay.nix;
    };
  };
}
