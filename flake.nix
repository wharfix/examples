{
  description = "Wharfix examples";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-compat.url = "github:edolstra/flake-compat";
  };

  outputs = { self, nixpkgs, ... }: {
    inherit nixpkgs;
  };
}
