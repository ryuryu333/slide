$ nix-build

$ ./result/bin/zlib-runner
zlib version: 1.3.2

$ ldd ./result/bin/zlib-runner
        linux-vdso.so.1 (0x0000734552d00000)
        libz.so.1 => /nix/store/dbz6pb9g67kpgpl95k8d85kzpxm1c32p-zlib-1.3.2/lib/libz.so.1 (0x0000734552cd4000)
        libc.so.6 => /nix/store/8kvxvr3pmsypxiypq4g8zy13glnfr7nx-glibc-2.42-67/lib/libc.so.6 (0x0000734552a00000)
        /nix/store/8kvxvr3pmsypxiypq4g8zy13glnfr7nx-glibc-2.42-67/lib/ld-linux-x86-64.so.2 => /nix/store/xx7cm72qy2c0643cm1ipngd87aqwkcdp-glibc-2.40-66/lib64/ld-linux-x86-64.so.2 (0x0000734552d02000)

$ json=zlib-runner.drv.json
drv=$(nix-instantiate default.nix)
nix derivation show "$drv" > "$json"

$ nix-instantiate '<nixpkgs>' -A zlib
/nix/store/92yhjpd6g9n92dxn52xv2f29h55g6n4z-zlib-1.3.2.drv

JSON
"inputs": {
    "drvs": {
        "92yhjpd6g9n92dxn52xv2f29h55g6n4z-zlib-1.3.2.drv": {

json=zlib.drv.json
drv=/nix/store/r0jrgfq91xkgva4j7bj32x43qwc2qchy-zlib-1.3.2.drv
nix derivation show "$drv" > "$json"



json=zlib.tar.drv.json
drv=/nix/store/akag406i2x9yrv04yz1ydq9hnh63pkks-zlib-1.3.2.tar.gz.drv
nix derivation show "$drv" > "$json"

