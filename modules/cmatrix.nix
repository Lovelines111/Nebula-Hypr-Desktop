{ config, lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.cmatrix ];
  };
}

