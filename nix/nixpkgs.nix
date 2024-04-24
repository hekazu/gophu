rec {
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/6143fc5eeb9c4f00163267708e26191d1e918932.tar.gz";
    sha256 = "sha256:0rmbq6jr21fvcspxshaiwmm5a1z66pykjm2f5imww9nhxn6dfgzv";
  }) {};
  compilerVersion = "ghc98";
  hPkgs = pkgs.haskell.packages."${compilerVersion}";
}
