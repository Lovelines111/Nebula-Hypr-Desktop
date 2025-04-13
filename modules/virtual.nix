{ config, pkgs, ... }:

{
  # Enable KVM and virtualization support
  virtualisation.libvirtd.enable = true;
  virtualisation.kvmgt.enable = true; # For Intel GPU passthrough (optional)
  virtualisation.spiceUSBRedirection.enable = true;

  # Install required packages
  environment.systemPackages = with pkgs; [
    qemu_kvm
    virt-manager
    spice
    spice-vdagent
  ];

  # Add your user to the libvirt group
  users.users.luvelyne.extraGroups = [ "libvirtd" "kvm" ];

  # Enable nested virtualization (if needed)
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}
