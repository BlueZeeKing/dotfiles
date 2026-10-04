{
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["brayden"];
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
