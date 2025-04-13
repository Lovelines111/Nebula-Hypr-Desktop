{
  description = "MacBook Air 2013 flake by Evi";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    hyprland.url = "github:hyprwm/Hyprland";

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    nur.url = "github:nix-community/NUR";
  };

 outputs = { self, nixpkgs, home-manager, nur, ... } @ inputs: {
    nixosConfigurations.bigcomputer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        inputs.nur.modules.nixos.default  # NUR module for NixOS
        ./configuration.nix
        ./hardware-configuration.nix
      ];
    };

    homeConfigurations."luvelyne" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./home.nix
      ];
    };
  };
}
