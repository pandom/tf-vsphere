variable "datacenter" {
  type    = string
  default = "Datacenter"

}

variable "working_folder" {
  type    = string
  default = "go"
}

variable "allow_unverified_ssl" {
  type        = bool
  description = "Allow insecure connections. Set to `true` for self-signed certificates."
  default     = false
}

variable "vsphere_server" {
  type        = string
  description = "vsphere server FQDN"
  default     = "vcsa-98975.fe9dbbb3.asia-southeast1.gve.goog"
}

variable "nsx_server" {
  type        = string
  description = "NSX server FQDN"
  default     = "nsx-98984.fe9dbbb3.asia-southeast1.gve.goog"
}

variable "nsx_user" {
  type        = string
  description = "default NSX User"
  default     = "admin"

}

variable "template" {
  type        = string
  description = "Current Image"
  default     = "linux-ubuntu-server-20-04-lts-1652801880"

}

variable "tags" {
  type = map
  description = "default tags"
  default = [
    "terraform": "managed",
    "burkey": "demo"
  ]
  
}
