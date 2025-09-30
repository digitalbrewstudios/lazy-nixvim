{
  description = "Private inputs for development purposes. These are used by the top level flake in the `dev` partition, but do not appear in consumers' lock files.";

  inputs = {
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    devshell.url = "github:numtide/devshell";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  # This flake is only used for its inputs.
  outputs = { ... }: { };
}
