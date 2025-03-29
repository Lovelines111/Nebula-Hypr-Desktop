# modules/cmatrix.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nebula.options.cmatrix;
in {
  config = mkIf cfg.enable {
    home.packages = [ pkgs.cmatrix ];
    home.shellAliases.matrix = "cmatrix";
  };
}
