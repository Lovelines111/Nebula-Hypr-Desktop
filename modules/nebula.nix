{ lib, ... }:

with lib;

{
  options.programs.nebula = {
    enable = mkEnableOption "Enable the Nebula meta-module";

    options = {
      cowsay = mkOption {
        enable = mkEnableOption "Enable cowsay pack";
        type = types.submoduleWithImports [ ./cowsay.nix ];
        default = {};
        description = "Cowsay pack options";
      };

      cmatrix = mkOption {
        type = types.submoduleWithImports [ ./cmatrix.nix ];
        default = {};
        description = "Cmatrix pack options";
      };
    };
  };

  # No `config = {}` block is needed here since submodules do their own thing
}
