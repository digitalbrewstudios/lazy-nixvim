{ inputs, lib, ... }:
{
  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem =
    {
      config,
      ...
    }:
    {
      devshells.default = {
        devshell.startup.pre-commit.text = config.pre-commit.installationScript;

        devshell.packages = [
          config.formatter
        ];

        commands = [
          {
            name = "format";
            help = "Format the entire codebase";
            command = lib.getExe config.formatter;
          }
        ];
      };
    };
}
