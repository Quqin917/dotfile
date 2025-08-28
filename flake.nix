{
  description = "NixOS configuration";

  inputs = {
    # NIX
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # The child flake for your neovim config
    # nixCats.url = "path:./user/nvim";

    # Musnix
    musnix  = { url = "github:musnix/musnix"; };

    # NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awesome-src = {
      url = "github:awesomeWM/awesome";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let 
    system = "x86_64-linux";      

    pkgs = import nixpkgs { 
      inherit system; 
    };
  in
  {
    nixosConfigurations.personal = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = [
        inputs.musnix.nixosModules.musnix
        inputs.home-manager.nixosModules.default

        ./hosts/personal/configuration.nix
      ];
    };
  };
}
