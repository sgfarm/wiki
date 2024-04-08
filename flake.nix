{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.flyctl ];
        };
      });
}
