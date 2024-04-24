let
  inherit (import nix/nixpkgs.nix) pkgs compiler;
in
  compiler.callCabal2nix "gophu" ./. {}
