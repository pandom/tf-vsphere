module "vsphere_machine" "web" {
  source  = "app.terraform.io/burkey/module-virtual-machine/vsphere"
  version = "1.1.2"

  datacenter        = var.datacenter
  cluster           = "Cluster"
  primary_datastore = "vsanDatastore"
  networks = {
    "seg-general" : "dhcp"
  }
  template = var.template
  tags     = var.tags
}
module "vsphere_machine" "app" {
  source  = "app.terraform.io/burkey/module-virtual-machine/vsphere"
  version = "1.1.2"

  datacenter        = var.datacenter
  cluster           = "Cluster"
  primary_datastore = "vsanDatastore"
  networks = {
    "seg-general" : "dhcp"
  }
  template = var.template
  tags     = var.tags
}
