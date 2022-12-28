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

    network {
        model = "virtio"
        bridge = "vmbr0"
    }
    disk {
        storage = "local-lvm"
        type = "virtio"
        size = "20G"
    }

    os_type = "cloud-init"
    nameserver = ""
    cluster = ""
    ipconfig0 = "ip=10.10.60.9${count.index + 1}/24,gw=10.10.60.1"
    
    sshkeys = <<EOF
    var.ssh_key
    EOF
}