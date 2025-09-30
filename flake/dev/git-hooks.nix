{ inputs, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
  ];

  perSystem =
    { config, ... }:
    {
      pre-commit = {
        # Not needed because treefmt.
        check.enable = false;
        treefmt = {
          enable = true;
          package = config.formatter;
        };
      };
    };
}
