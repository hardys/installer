output "api_sg_id" {
  value = "${openstack_networking_secgroup_v2.api.id}"
}

output "console_sg_id" {
  value = "${openstack_networking_secgroup_v2.console.id}"
}

output "master_sg_id" {
  value = "${openstack_networking_secgroup_v2.master.id}"
}

output "master_subnet_ids" {
  value = "${local.master_subnet_ids}"
}

output "worker_sg_id" {
  value = "${openstack_networking_secgroup_v2.worker.id}"
}

output "worker_subnet_ids" {
  value = "${local.worker_subnet_ids}"
}

output "bootstrap_port_id" {
  value = "${openstack_networking_port_v2.bootstrap_port.id}"
}
