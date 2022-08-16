##
data "nsxt_policy_tier0_gateway" "this" {
  display_name = "Provider-LR"
}
data "nsxt_policy_edge_cluster" "this" {
  display_name = "edge-cluster"
}

data "nsxt_policy_transport_zone" "this" {
  display_name = "TZ-OVERLAY"
}

resource "nsxt_policy_tier1_gateway" "this" {
    description               = "Tier-1 provisioned by Terraform"
    display_name              = "tier1-go-telstra"
    nsx_id                    = "predefined_id"
    edge_cluster_path         = data.nsxt_policy_edge_cluster.this.path
    failover_mode             = "PREEMPTIVE"
    default_rule_logging      = "false"
    enable_firewall           = "true"
    enable_standby_relocation = "false"
    tier0_path                = data.nsxt_policy_tier0_gateway.this.path
    route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
    pool_allocation           = "ROUTING"
}

resource "nsxt_dhcp_server_profile" "this" {
  edge_cluster_id = data.nsxt_policy_edge_cluster.this.id
}

resource "nsxt_logical_dhcp_server" "this" {
  display_name     = "logical_dhcp_server"
  description      = "logical_dhcp_server provisioned by Terraform"
  dhcp_profile_id  = nsxt_dhcp_server_profile.this.id
  dhcp_server_ip   = "192.168.1.2/24"
  gateway_ip       = "192.168.1.1"
  domain_name      = "abc.com"
  dns_name_servers = ["1.1.1.1"]
}
resource "nsxt_policy_segment" "segment1" {
display_name        = "segment1"
  description         = "Terraform provisioned Segment"
  connectivity_path   = nsxt_policy_tier1_gateway.this.path
  transport_zone_path = data.nsxt_policy_transport_zone.this.path

#   subnet {
#     cidr = "192.168.250.1/24"
#     dhcp_ranges = ["192.168.250.10-192.168.250.100"]
#     dhcp_v4_config {
#       server_address = "192.168.250.2/24"
#       lease_time     = 36000
#     }
# }
}
resource "nsxt_policy_tier1_gateway_interface" "this" {
  display_name           = "segment1_interface"
  description            = "connection to segment1"
  gateway_path           = nsxt_policy_tier1_gateway.this.path
  segment_path           = nsxt_policy_segment.segment1.path
  subnets                = ["192.168.250.0/24"]
  mtu                    = 1500
}