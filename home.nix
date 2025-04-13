{ config, pkgs, ... }:
let
  modules = import ./modules/home;
in
{
  imports = with modules; [
  gnome
  # hyprland
	kitty
	GTK
  wezterm
  helix
  hyprpannel
  zsh
  ];


  programs.home-manager.enable = true;

  home.username = "luvelyne";
  home.homeDirectory = "/home/luvelyne";

  home.packages = with pkgs; [
    blahaj
    eza
    lolcat
    figlet
    neofetch
    popcorntime
    kitty 
    wl-clipboard
    prismlauncher
    bottles
    qbittorrent
    libreoffice-still-unwrapped    
    spotify-player
    webcord
    vlc
    cava
    obs-studio
    obs-cmd
    openrgb  #!!! The package is also installed in home.nix!!!
    direnv
    strawberry
    droidcam

     
    ];

  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;


  home.stateVersion = "24.11"; 
}

