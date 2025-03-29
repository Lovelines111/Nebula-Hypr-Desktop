{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nebula;
in {
  options.programs.nebula = {
    enable = mkEnableOption "Enable the Nebula meta-module";

    cowsay-pack = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the cowsay pack.";
    };

    cmatrix-pack = mkOption {
      type = types.bool;
      default = false;
      description = "Enable the cmatrix pack.";
    };
  };

  config = mkIf cfg.enable {
    imports = lib.flatten [
      (lib.optional cfg.cowsay-pack ./cowsay.nix)
      (lib.optional cfg.cmatrix-pack ./cmatrix.nix)
    ];
  };
}
