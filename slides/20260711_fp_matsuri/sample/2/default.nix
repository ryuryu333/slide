{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "zlib-runner";
  version = "0.1.0";

  dontUnpack = true;

  buildInputs = [
    pkgs.zlib
  ];

  buildPhase = ''
    cat > zlib-runner.c <<'EOF'
    #include <stdio.h>
    #include <zlib.h>

    int main(void) {
      printf("zlib version: %s\n", zlibVersion());
      return 0;
    }
    EOF

    $CC zlib-runner.c -o zlib-runner -lz
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp zlib-runner $out/bin/
  '';
}