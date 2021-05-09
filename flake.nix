{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlay ];
            config.allowUnfree = true;
          };
        in
        {
          packages.discocss = pkgs.discocss;

          defaultPackage = self.packages.${system}.discocss;
        })
    ) // {
      overlay = final: prev: {
        discocss = prev.callPackage (import ./.) { };
      };

      hmModule = import ./hm-module.nix;
    };
}
