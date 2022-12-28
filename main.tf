resource "proxmox_vm_qemu" "my_vm" {
    name        = "my_vm"
    desc        = "My VM image"
    count = 1
    target_node = var.proxmox_host
    iso         = "ISO file name"
    vmid        = 100
    agent = 1

    clone = "ubutu-20.04-focal"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048

}