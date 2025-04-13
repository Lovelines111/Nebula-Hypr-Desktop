# modules/gnome.nix
{ config, pkgs, lib, ... }:

let
  dconfFile = ../dconf/gnome-settings.dconf;
in
{
  imports = [];
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
   
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];


}


