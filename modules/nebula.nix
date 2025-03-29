# modules/nebula.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nebula;
in {
  options.programs.nebula = {
    enable = mkEnableOption "Enable Nebula programs";
    options = {
      cmatrix.enable = mkEnableOption "Enable cmatrix";
      cowsay.enable = mkEnableOption "Enable cowsay";
    };
  };

  config = mkIf cfg.enable {
    imports = [
      (mkIf cfg.options.cmatrix.enable ./cmatrix.nix)
      (mkIf cfg.options.cowsay.enable ./cowsay.nix)
    ];
  };
}
