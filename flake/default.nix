{
  inputs,
  ...
}:
{
  imports = [
    ./nixvim.nix
    inputs.flake-parts.flakeModules.partitions
  ];

  partitions = {
    dev = {
      module = ./dev;
      extraInputsFlake = ./dev;
    };
  };

  partitionedAttrs = {
    #checks = "dev";
    devShells = "dev";
    #formatter = "dev";
  };
}
