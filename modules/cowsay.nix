# modules/cowsay.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nebula.options.cowsay;
in {
  config = mkIf cfg.enable {
    home.packages = [ pkgs.cowsay ];
  };
}
