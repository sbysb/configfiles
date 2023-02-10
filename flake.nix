{
  description = "Main flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
      home-manager.url = "github:nix-community/home-manager/release-22.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though
      darwin.url = "github:lnl7/nix-darwin";
      darwin.inputs.nixpkgs.follows = "nixpkgs"; # ...
  };
   # add the inputs declared above to the argument attribute set
  outputs = { self, nixpkgs, home-manager, darwin }: {
    darwinConfigurations.Samuels-MacBook-Pro = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ 
        home-manager.darwinModules.home-manager
        ./hosts/samuelmacbook/default.nix 
      ];
    };
  };
}
