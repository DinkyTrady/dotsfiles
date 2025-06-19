{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    distrobox
    docker
    docker-init
    docker-slim
    docker-compose
    # virt-manager
    # virtio-win
    # win-spice
  ];

  virtualisation = {
    waydroid.enable = true;

    podman.enable = true;

    docker.enable = true;

    # libvirtd = {
    #   enable = true;
    #   qemu = {
    #     swtpm.enable = true;
    #     ovmf = {
    #       enable = true;
    #       packages = [ pkgs.OVMFFull.fd ];
    #     };
    #     package = pkgs.qemu_kvm;
    #     vhostUserPackages = [ pkgs.virtiofsd ];
    #   };
    # };
    # spiceUSBRedirection.enable = true;
  };
}
