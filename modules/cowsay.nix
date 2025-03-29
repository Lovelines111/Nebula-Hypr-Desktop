{ config, lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.cowsay ];
    home.shellAliases.nebula = "cowsay 'Welcome to Nebula!'";
  };
}
