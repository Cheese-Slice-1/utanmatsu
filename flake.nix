{
  description = "Seabun development shell/environment; everything included ( + micro)";
  
  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
  
  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux"; # idk how to add more, if you're not on x86_64, use `nix-shell` or change this
      pkgs = import nixpkgs { inherit system; };
      
      #llvm21 = pkgs.llvmPackages_21;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "utanmatsu-dev-flake";
        
        packages = with pkgs; [
          #qemu # for testing other architectures
          
          odin
          just
        ];
        
        shellHook = ''
          echo '* run "just -l" to see available recipes'
          echo '* run "just check" to check for errors'
        '';
      };
    };
}

