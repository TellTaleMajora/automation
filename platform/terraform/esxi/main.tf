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
  esxi_hostname      = "<add>"
  esxi_hostport      = "22"
  esxi_hostssl       = "443"
  esxi_username      = "<add>"
  esxi_password      = "<add>"
}

resource "esxi_guest" "centos" {
  guest_name         = "centos"
  disk_store         = "Primary"
  ovf_source         = "templates/centos.ovf"
  numvcpus	     = "4"
  memsize	     = "2048"

  network_interfaces {
    virtual_network = "VM Network"
  }
}
