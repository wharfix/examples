let
  _pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/71d7a4c037dc4f3e98d5c4a81b941933cf5bf675.tar.gz";
    sha256 = "sha256:0mz1mrygnpwv87dd0sac32q3m8902ppn9zrkn4wrryljwvvpf60s";
  }) { config = {}; };
in
{ pkgs ? _pkgs, ... }:
{
  entryscript = import ./images/entryscript.nix { inherit pkgs; };
  kubectl = import ./images/kubectl.nix { inherit pkgs; };
  nyancat = import ./images/nyancat.nix { inherit pkgs; };
  sl = import ./images/sl.nix { inherit pkgs; };
  toolbox = import ./images/toolbox.nix { inherit pkgs; };
  inherit pkgs;
}
