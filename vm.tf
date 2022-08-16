data "vsphere_folder" "folder" {
  path = "/hashicorp/${var.working_folder}"
  datacenter = var.datacenter
}