data "vsphere_folder" "folder" {
  path = "${var.datacenter}/vm/${var.working_folder}"
}