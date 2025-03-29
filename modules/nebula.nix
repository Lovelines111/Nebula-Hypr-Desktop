{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nebula;
in {
  options.programs.nebula = {
    enable = mkEnableOption "Enable the Nebula meta-module";

    cowsay = {
      enable = mkEnableOption "Enable the cowsay pack";
      greeting = mkOption {
        type = types.str;
        default = "Welcome to Nebula!";
        description = "The cowsay greeting message.";
      };
    };

    cmatrix = {
      enable = mkEnableOption "Enable the cmatrix pack";
      rainbow = mkOption {
        type = types.bool;
        default = false;
        description = "Enable rainbow mode (imaginary setting).";
      };
    };
  };

  # ✅ This is the correct top-level 'imports' field
  imports =
    lib.optionals cfg.enable (
      lib.flatten [
        (lib.optional cfg.cowsay.enable ./cowsay.nix)
        (lib.optional cfg.cmatrix.enable ./cmatrix.nix)
      ]
    );

  config = mkIf cfg.enable {
    # You could set global options here if needed
  };
}
