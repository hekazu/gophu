let
  inherit (import nix/nixpkgs.nix) pkgs hPkgs;
in
  hPkgs.callCabal2nix "gophu" ./. {}
