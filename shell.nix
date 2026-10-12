{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "utanmatsu-dev-shell";
  
  packages = with pkgs; [
    odin
    just
  ];
  
  shellHook = ''
    echo '* run "just -l" to see available recipes'
    echo '* run "just check" to check for errors'
  '';
}

