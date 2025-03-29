{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config;
in {
  options = {
    enable = mkEnableOption "Enable cowsay";
    greeting = mkOption {
      type = types.str;
      default = "Welcome to Nebula!";
      description = "Greeting message for cowsay.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.cowsay ];
    home.shellAliases.nebula = "cowsay '${cfg.greeting}'";
  };
}
