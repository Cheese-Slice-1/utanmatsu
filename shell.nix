{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "odin-shell";
  packages = with pkgs; [
    odin
    just
  ];
}

