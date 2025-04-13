{ pkgs, ...}:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    };

  environment.systemPackages = with pkgs; [
    kitty
    nautilus
    fuzzel
    swww
    slurp
    grim
    wl-clipboard
    swappy
    libnotify
    pavucontrol
    networkmanagerapplet    
  ];

  environment.variables = {
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Bibata-Modern-Classic";
  };

  #For screen caprute (gnome bridge)
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
  };

}
