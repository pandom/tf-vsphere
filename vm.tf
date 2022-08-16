data "vsphere_folder" "folder" {
  path = "/${var.datacenter}/hashicorp/${var.working_folder}"
}