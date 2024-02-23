let
  _pkgs = import (import ./flake-compat.nix).nixpkgs { config = {}; };
in
{ pkgs ? _pkgs, ... }:
{
  entryscript = import ./images/entryscript.nix { inherit pkgs; };
  nyancat = import ./images/nyancat.nix { inherit pkgs; };
  sl = import ./images/sl.nix { inherit pkgs; };
  toolbox = import ./images/toolbox.nix { inherit pkgs; };
  inherit pkgs;
}
