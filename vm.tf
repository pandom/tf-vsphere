module vsphere_machine {
  source = "app.terraform.io/burkey/module-virtual-machine/vsphere"
  version = "1.1.2"

  datacenter                = var.datacenter
  cluster                   = "Cluster"
  primary_datastore_cluster = "vsanDatastore"
  networks                  = {
    "seg-general":"dhcp"
  }
  template                  = var.template
}
