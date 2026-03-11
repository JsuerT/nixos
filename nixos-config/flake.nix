{
  description = "flakeConfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
     nixosConfigurations = {
      "pc" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/pc/default.nix ]; 
      };

      "laptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/laptop/default.nix ];
      };
    };
  };
}
