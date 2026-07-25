{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellApplication {
  name = "rt-only-demo";

  runtimeInputs = [
    pkgs.cowsay
  ];
  
  inheritPath = false;

  text = ''
    cowsay "runtime dependency"
  '';
}