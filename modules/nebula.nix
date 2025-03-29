{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nebula;
in {
  options.programs.nebula = {
    enable = mkEnableOption "Enable the Nebula meta-module";

    cowsay = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the cowsay pack.";
    };

    cmatrix = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the cmatrix pack.";
    };
  };

  config = mkIf cfg.enable {
    imports = lib.flatten [
      (lib.optional cfg.cowsay ./cowsay.nix)
      (lib.optional cfg.cmatrix ./cmatrix.nix)
    ];
  };
}
