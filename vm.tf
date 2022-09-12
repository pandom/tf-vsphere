module vsphere_machine {
  source = "app.terraform.io/burkey/terraform-vsphere-module-virtual-machine/vsphere"

  datacenter                = var.datacenter
  cluster                   = "Cluster"
  primary_datastore_cluster = "vsanDatastore"
  networks                  = {
    "seg-general":"dhcp"
  }
  template                  = var.template
}
