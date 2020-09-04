terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
      #
      # For more information, see the provider source documentation:
      # https://github.com/josenk/terraform-provider-esxi
      # https://registry.terraform.io/providers/josenk/esxi
    }
  }
}

provider "esxi" {
  esxi_hostname      = "192.168.2.10"
  esxi_hostport      = "22"
  esxi_hostssl       = "443"
  esxi_username      = "root"
  esxi_password      = "Iamhereben0)"
}

resource "esxi_guest" "test" {
  guest_name         = "test"
  disk_store         = "Primary"
  ovf_source         = "templates/centos.ovf"
  numvcpus	     = "2"
  memsize	     = "1024"

  network_interfaces {
    virtual_network = "VM Network"
  }
}
