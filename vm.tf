data "vsphere_folder" "folder" {
  path = "${var.datacenter}/${var.working_folder}"
}