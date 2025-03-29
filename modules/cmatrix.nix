{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config;
in {
  options = {
    enable = mkEnableOption "Enable cmatrix pack";
    rainbow = mkOption {
      type = types.bool;
      default = false;
      description = "Enable rainbow mode.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.cmatrix ];
    home.shellAliases.matrix =
      if cfg.rainbow then "cmatrix -r" else "cmatrix";
  };
}
