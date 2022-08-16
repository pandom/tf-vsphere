variable "datacenter" {
    type = string
    default = "Datacenter"
  
}

variable "working_folder" {
    type = string
    default = "go"
  }

variable "allow_unverified_ssl" {
  type        = bool
  description = "Allow insecure connections. Set to `true` for self-signed certificates."
  default     = false
}

variable "vsphere_server" {
    type = string
    description = "vsphere server FQDN"
    #default = "https://vcsa-98975.fe9dbbb3.asia-southeast1.gve.goog"
}

variable "nsx_server" {
    type = string
    description = "NSX server FQDN"
    #default = "https://nsx-98984.fe9dbbb3.asia-southeast1.gve.goog/"
}
