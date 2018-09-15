output "Datacenter ID" {
    value = "${data.vsphere_datacenter.dc.id}"
}

output "esxi1 Host ID" {
    value = "${data.vsphere_host.h_esxi1.id}"
}
output "esxi2 Host ID" {
    value = "${data.vsphere_host.h_esxi2.id}"
}
output "esxi1-b012345 Datastore ID" {
    value = "${data.vsphere_datastore.ds_esxi1-b012345.id}"
}
output "esxi1-b67 Datastore ID" {
    value = "${data.vsphere_datastore.ds_esxi1-b67.id}"
}
output "esxi2-b012345 Datastore ID" {
    value = "${data.vsphere_datastore.ds_esxi2-b012345.id}"
}
output "esxi2-b67 Datastore ID" {
    value = "${data.vsphere_datastore.ds_esxi2-b67.id}"
}
output "nasisos Datastore ID" {
    value = "${data.vsphere_datastore.ds_nasisos.id}"
}
output "esxi1 disks avail" {
    value = ["${data.vsphere_vmfs_disks.vds_avail_h_esxi1.disks}"]
}
output "esxi2 disks avail" {
    value = ["${data.vsphere_vmfs_disks.vds_avail_h_esxi2.disks}"]
}

### Datastores #################################################################

### Networking #################################################################

output "dswitch1 distributed virtual switch ID" {
    value = "${data.vsphere_distributed_virtual_switch.dvs_dswitch1.id}"
}
output "dswitch1 distributed virtual switch Uplinks" {
    value = "${data.vsphere_distributed_virtual_switch.dvs_dswitch1.uplinks}"
}
output "network dportgroup1 ID" {
    value = "${data.vsphere_network.net_dpg1.id}"
}

output "network dportgroup1 Type" {
    value = "${data.vsphere_network.net_dpg1.type}"
}

### Networking #################################################################