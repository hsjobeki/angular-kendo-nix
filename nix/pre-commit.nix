let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs { };
  nix-pre-commit-hooks = import sources."pre-commit-hooks.nix";
  tsconfig = "tsconfig.json";
in
{
  pre-commit-check = nix-pre-commit-hooks.run {
    src = ../.;
    excludes = [ "nix/node.nix" "nix/node-env.nix" "nix/node-packages.nix" ];
    hooks = {
      statix.enable = true;
      nixpkgs-fmt.enable = true;
      eslint.enable = true;
      prettier.enable = true;
    };
    settings = {
      statix.ignore = [ "nix/sources.nix" "nix/node.nix" "nix/node-env.nix" "nix/node-packages.nix" ];
      eslint = {
        extensions = "\.[jt]sx?$";
      };
    };
  };
}
