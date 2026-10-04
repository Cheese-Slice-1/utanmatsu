{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "utanmatsu-dev-shell";
  packages = with pkgs; [
    odin
    just
  ];
}

