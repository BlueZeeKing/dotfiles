{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosConfigurations.braydens-laptop = nixpkgs.lib.nixosSystem {
      modules = [
        ./nix/configuration.nix
	{
          nix.registry = {
            nixpkgs.flake = nixpkgs;
          };
	}
      ];
    };
  };
}
