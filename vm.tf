data "vsphere_datacenter" "this" {
  name = var.datacenter
}
resource "vsphere_folder" "this" {
  path = "terraform-vm-folder"
  type = "vm"
  datacenter_id = data.vsphere_datacenter.this.id
}


# Create a 

