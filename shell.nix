let
  inherit (import nix/nixpkgs.nix) pkgs hPkgs;
in
  hPkgs.developPackage {
    root = ./.;
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with hPkgs;
        [ cabal-install
          ghcid
          haskell-language-server
        ]);
  }
