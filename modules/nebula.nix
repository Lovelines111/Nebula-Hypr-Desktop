{ lib, ... }:

with lib;

{
  options.programs.nebula = {
    enable = mkEnableOption "Enable the Nebula meta-module";

    packs = {
      cowsay = mkOption {
        type = types.submoduleWithImports [ ./cowsay.nix ];
        default = {};
        description = "Config for cowsay pack";
      };

      cmatrix = mkOption {
        type = types.submoduleWithImports [ ./cmatrix.nix ];
        default = {};
        description = "Config for cmatrix pack";
      };
    };
  };
}
