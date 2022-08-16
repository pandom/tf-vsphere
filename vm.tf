data "vsphere_folder" "folder" {
  path = "/${var.datacenter}/vm/hashicorp/vm/${var.working_folder}"
}