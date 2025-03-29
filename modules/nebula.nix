{ lib, ... }:

with lib;

{
  options.programs.nebula = {
    enable = mkEnableOption "Enable the Nebula meta-module";

    cowsay = mkOption {
      type = types.submoduleWithImports [ ./cowsay.nix ];
      default = {};
      description = "Cowsay module settings";
    };

    cmatrix = mkOption {
      type = types.submoduleWithImports [ ./cmatrix.nix ];
      default = {};
      description = "Cmatrix module settings";
    };
  };
}
