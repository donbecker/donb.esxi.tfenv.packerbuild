provider "vsphere" {
  user           = ""
  password       = ""
  vsphere_server = ""


  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter1"
}

### Hosts ######################################################################
data "vsphere_host" "h_esxi1" {
  name          = "esxi1.pine.lab"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_host" "h_esxi2" {
  name          = "esxi2.pine.lab"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
### Hosts ######################################################################

### Datastores #################################################################
data "vsphere_datastore" "ds_esxi1-b012345" {
  name          = "esxi1-b012345"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_datastore" "ds_esxi1-b67" {
  name          = "esxi1-b67"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_datastore" "ds_esxi2-b012345" {
  name          = "esxi2-b012345"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_datastore" "ds_esxi2-b67" {
  name          = "esxi2-b67"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_datastore" "ds_nasisos" {
  name          = "NASISOS"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# note that new datastores aren't able to be added from local disks
# due to terraform trying to auto-add them to every host...wtf
data "vsphere_vmfs_disks" "vds_avail_h_esxi1" {
  host_system_id = "${data.vsphere_host.h_esxi1.id}"
  rescan         = true
}

data "vsphere_vmfs_disks" "vds_avail_h_esxi2" {
  host_system_id = "${data.vsphere_host.h_esxi2.id}"
  rescan         = true
}

### Datastores #################################################################

### Networking #################################################################
data "vsphere_distributed_virtual_switch" "dvs_dswitch1" {
  name          = "DSwitch1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "net_dpg1" {
  name          = "DPortGroup1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

### Networking #################################################################