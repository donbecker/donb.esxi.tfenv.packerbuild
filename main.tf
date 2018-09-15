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

data "vsphere_host" "h_esxi1" {
  name          = "esxi1.pine.lab"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_host" "h_esxi2" {
  name          = "esxi2.pine.lab"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

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

data "vsphere_vmfs_disks" "vds_avail_h_esxi1" {
  host_system_id = "${data.vsphere_host.h_esxi1.id}"
  rescan         = true
}

data "vsphere_vmfs_disks" "vds_avail_h_esxi2" {
  host_system_id = "${data.vsphere_host.h_esxi2.id}"
  rescan         = true
#  filter         = "naa.60a98000"
#  filter         = "naa.6842b2b0"
}
