# This is the configuration of my NixOS For MacBook Air 6,2 2013!!
# It's extra cute with some tweaks. Vesktop uses ClientTheme addon with #5e3640 color.
# Librewolf is using this theme: https://addons.mozilla.org/en-US/firefox/addon/classicpink/
# Don't forget to apply dconf from the folder nearby for gnome config and openbar config too :3

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./modules/gnome.nix
      #./modules/vpn.nix
      ./modules/steam.nix
      ./modules/v2rayA.nix
      ./modules/nvidia.nix
      ./modules/hyprland.nix
      # ./modules/sddm.nix
      ./modules/virtual.nix
    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=8 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  security.polkit.enable = true;

  networking = {
  hostName = "bigcomputer";
  wireless.enable = false;
  networkmanager.enable = true;
  networkmanager.dns = "none";
  nameservers = [ "9.9.9.9" "9.9.9.11" ]; #DNS
  dhcpcd.extraConfig = "nohook resolv.conf";
  };
  services.resolved.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #RGB controls. !!! The package is also installed in home.nix!!!
  services.hardware.openrgb.enable = true;
  
  hardware.cpu.intel.updateMicrocode = true;
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "ondemand"; # or "powersave"

  
  #Camear support
  hardware.facetimehd.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.luvelyne = {
  	isNormalUser = true;
	  description = "Evi"; # Login prompt
    shell = pkgs.zsh;
	  extraGroups = [ "networkmanager" "wheel" "audio" "video" "libvirtd" "kvm" ];
    packages = with pkgs; [
       (wrapOBS {
        plugins = with obs-studio-plugins; [
          droidcam-obs
        ];
      })
       ];
  };

  programs.zsh.enable = true;

  # Display manager
  services = {
  xserver.displayManager.gdm.enable = true;
  xserver.displayManager.gdm.wayland = true;
  };


  # Fonts
    fonts.packages = with pkgs; [
     jetbrains-mono
     nerd-font-patcher
     nerd-fonts.fira-code
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  
  # Keyboard Layouts:
  services.xserver.xkb = {
    layout = "ch, ru";
    variant = "de";
    options = "grp:win_space_toggle";
  };

  # Configure console keymap # No idea what it's for tbh
  console.keyMap = "sg";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Install firefox.
  programs.firefox.enable = false; # So long firefox reputation O7

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # I've Only added essential programs here, the rest is in home.
  environment.systemPackages = with pkgs; [
    vim
    neovim
    peazip
    helix
    wget
    git
    v2raya
    v2ray
    xray
    telegram-desktop
    vesktop
    librewolf
    bitwarden-desktop
    spotify
    firejail
    rpi-imager
    vlc
    ffmpeg-full
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 10808 53 4747 ];
   networking.firewall.allowedUDPPorts = [ 22 10808 53 4747 ];
   networking.firewall.trustedInterfaces = [ "tun0" ]; #allow vpn connection. I don't know what ports it's using so I had to go with the device.
   networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
