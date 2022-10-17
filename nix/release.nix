let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs { overlays = [ (import ./overlay.nix) ]; };
in
{
  inherit (pkgs.ng) staticSite;
  dev-shell = pkgs.mkShell {
    inputsFrom = [ pkgs.ng.staticSite ];
    packages = with pkgs; [
      # nix dev tools
      niv
      nixpkgs-fmt
      statix
      # node dev tools
      nodejs-16_x
      nodePackages.eslint
      nodePackages.typescript
      nodePackages.node2nix
    ];

    shellHook = ''
      ${(import ./pre-commit.nix).pre-commit-check.shellHook}
    '';
  };
}
