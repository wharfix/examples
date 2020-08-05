let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/581937d380aca9a3455687999f1bf14729278356.tar.gz";
    sha256 = "0q7mj91qf84mnffvqxbfkfq5d0z66q151c9869y0f1sq74zbddvm";
  }) {};
in
{
  entryscript = import ./images/entryscript.nix { inherit pkgs; };
  sl = import ./images/sl.nix { inherit pkgs; };
  toolbox = import ./images/toolbox.nix { inherit pkgs; };
}