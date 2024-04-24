let
  inherit (import nix/nixpkgs.nix) pkgs compiler;
in
  compiler.developPackage {
    root = ./.;
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
        [ cabal-install
          ghcid
          haskell-language-server
        ]);
  }
