{ inputs, ... }:
{
  imports = [
    inputs.pre-commit-hooks.flakeModule
  ];
  perSystem.pre-commit = {
    check.enable = true;
    settings = {
      excludes = [ "flake.lock" ];
      hooks = {
        statix.enable = true;
        nixfmt-rfc-style.enable = true;
        flake-checker.enable = true;
        deadnix.enable = true;
      };
    };
  };
}
