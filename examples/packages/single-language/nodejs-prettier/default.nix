{
  lib,
  config,
  dream2nix,
  ...
}: let
  l = lib // builtins;
in {
  imports = [
    dream2nix.modules.drv-parts.nodejs-package-lock
    dream2nix.modules.drv-parts.nodejs-granular
  ];

  mkDerivation = {
    src = config.deps.fetchFromGitHub {
      owner = "davhau";
      repo = "prettier";
      rev = "2.8.7-package-lock";
      sha256 = "sha256-zo+WRV3VHja8/noC+iPydtbte93s5GGc3cYaQgNhlEY=";
    };
  };

  deps = {nixpkgs, ...}: {
    inherit
      (nixpkgs)
      fetchFromGitHub
      stdenv
      ;
  };

  name = l.mkForce "prettier";
  version = l.mkForce "2.8.7";
}