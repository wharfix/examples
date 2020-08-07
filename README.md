# wharfix-examples

Example repository for wharfix expressions

## What is Wharfix?

The idea is a stateless docker registry with Git as the single source of truth.
See more (including source code) at: https://wharfix.dev

**BIG FAT NOT USE IN PRODUCTION NOTE** this is still a proof-of-concept.

## Repository layout

For now, there *must* exist a `/default.nix` in the root of the repo.
This file acts as an index for all available images in the registry.

`default.nix` must contain an attribute set of image name => image build expression.

For more information on how to write nixpkgs dockerTools expressions, see:
https://nixos.org/nixpkgs/manual/#sec-pkgs-dockerTools

Note that the expression read by Wharfix is passed internally to `dockerTools.buildLayeredImage`,
so you don't need to invoke dockerTools functions manually.
Also; buildLayeredImage implies that `runAsRoot` cannot be used.

## How to use it

For kind of obvious reasons, the registry supports *only* the pull-operation.
Pushing images is not possible. You push to Git, not Wharfix :).

`docker pull <registry>.wharfix.dev/<image>:<git-ref>`

e.g. if your registry is backed by this repo, you could run:
`docker run -it --rm <registry>.wharfix.dev/nyancat:master` or
`docker run -it --rm <registry>.wharfix.dev/sl:4e60d43a8a8e000a57bf21a7b3b28f8dc7522438`

("latest" means nothing whatsoever in Wharfix-land, unless you have a branch, tag or some other symbolic git ref named "latest")

All images are build on-the-fly, so for first-time builds, pull latency can be a bit high.
