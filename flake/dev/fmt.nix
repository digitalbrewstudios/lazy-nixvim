{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        flakeCheck = true;

        programs = {
          statix.enable = true;
          deadnix = {
            enable = true;
            noLambdaArg = true;
            noLambdaPatternNames = true;
            edit = true;
          };
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rfc-style;
          };
        };
      };
    };
}
