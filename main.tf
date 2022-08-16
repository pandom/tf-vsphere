terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.2.0"
      #ENVARS OR VARSETS for credentials
    }
    nsxt = {
      source = "vmware/nsxt"
      version = "3.2.8"
    }
  }
}

provider "vsphere" {
  # user                 = var.vsphere_user
  # password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = var.allow_unverified_ssl
}

provider "nsxt" {
  allow_unverified_ssl = var.allow_unverified_ssl
  host = var.nsx_server
  max_retries = 3
  username = "admin"
  
}