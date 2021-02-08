let
  _pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/3090c65041104931adda7625d37fa874b2b5c124.tar.gz";
    sha256 = "0r0gfsvvh69cy39izrgqhqlj26hxdqf37n3is6b6pma75k97axsj";
  }) { config = {}; };
in
{ pkgs ? _pkgs, ... }:
{
  entryscript = import ./images/entryscript.nix { inherit pkgs; };
  nyancat = import ./images/nyancat.nix { inherit pkgs; };
  sl = import ./images/sl.nix { inherit pkgs; };
  toolbox = import ./images/toolbox.nix { inherit pkgs; };
  inherit pkgs;
}
