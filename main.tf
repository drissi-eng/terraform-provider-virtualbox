        terraform {
          required_providers {
            virtualbox = {
              source = "terra-farm/virtualbox"
              version = "0.0.1" # Use the appropriate version
            }
          }
        }

        provider "virtualbox" {
          # Optional: Specify VirtualBox installation path if not in default location
          # vboxmanage_path = "/path/to/VBoxManage"
           vboxmanage_path = "/usr/bin/VBoxManage"
        }

        resource "virtualbox_vm" "linux_vm" {
          name = "my-linux-vm"
        #  image = "/path/to/your/linux.iso" # Path to your Linux ISO file
          image = "/home/belhaj/Downloads/AlmaLinux-10.0-x86_64-dvd.iso" # Path to your Linux ISO file
          cpus = 2
          memory = "2048" # MB
          disk_size = "20000" # MB
          network_adapter {
            type = "Bridged"
            bridge = "en0" # Replace with your host's network interface
          }
          # Optional: Configure more settings like shared folders, guest additions, etc.
        }
