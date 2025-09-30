{
  inputs,
  self,
  ...
}:
{
	imports = [
    inputs.nixvim.flakeModules.default
  ];

	nixvim = {
    packages.enable = true;
    checks.enable = true;
  };

	flake.nixvimModules = {
    default = ../nixvim;
  };

	      perSystem =
        { system, ... }:
        {
          # You can define actual Nixvim configurations here
          nixvimConfigurations = {
            default = inputs.nixvim.lib.evalNixvim {
              inherit system;
              modules = [
                self.nixvimModules.default
              ];
            };
          };
        };
}
