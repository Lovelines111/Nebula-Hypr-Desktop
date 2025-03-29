{ config, lib, pkgs, ... }:

with lib;

{
  options.programs.nebula = {
    enable = mkEnableOption "Nebula program module";
  };

  config = mkIf config.programs.nebula.enable {
    home.packages = with pkgs; [
      hello
      cowsay
    ];

    # Optional: maybe expose a greeting or shell alias
    home.shellAliases.nebula = "cowsay 'Welcome to Nebula!'";
  };
}

