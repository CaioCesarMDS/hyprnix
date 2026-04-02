{
  description = "CaioCesarMDS NixoS config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      vars = import ./hosts/default/variables.nix;
    in
    {
      nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs vars; };
        modules = [
          ./hosts/default/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = { inherit inputs vars; };

              users.${vars.username} = import ./hosts/default/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
