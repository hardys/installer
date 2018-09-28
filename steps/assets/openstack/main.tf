provider "openstack" {
  auth_url            = "${var.tectonic_openstack_credentials_auth_url}"
  cacert_file         = "${var.tectonic_openstack_credentials_cacert_file}"
  cert                = "${var.tectonic_openstack_credentials_cert}"
  cloud               = "${var.tectonic_openstack_credentials_cloud}"
  domain_id           = "${var.tectonic_openstack_credentials_domain_id}"
  domain_name         = "${var.tectonic_openstack_credentials_domain_name}"
  endpoint_type       = "${var.tectonic_openstack_credentials_endpoint_type}"
  insecure            = "${var.tectonic_openstack_credentials_insecure}"
  key                 = "${var.tectonic_openstack_credentials_key}"
  password            = "${var.tectonic_openstack_credentials_password}"
  project_domain_id   = "${var.tectonic_openstack_credentials_project_domain_id}"
  project_domain_name = "${var.tectonic_openstack_credentials_project_domain_name}"
  region              = "${var.tectonic_openstack_region}"
  region              = "${var.tectonic_openstack_credentials_region}"
  swauth              = "${var.tectonic_openstack_credentials_swauth}"
  tenant_id           = "${var.tectonic_openstack_credentials_tenant_id}"
  tenant_name         = "${var.tectonic_openstack_credentials_tenant_name}"
  token               = "${var.tectonic_openstack_credentials_token}"
  use_octavia         = "${var.tectonic_openstack_credentials_use_octavia}"
  user_domain_id      = "${var.tectonic_openstack_credentials_user_domain_id}"
  user_domain_name    = "${var.tectonic_openstack_credentials_user_domain_name}"
  user_id             = "${var.tectonic_openstack_credentials_user_id}"
  user_name           = "${var.tectonic_openstack_credentials_user_name}"
  version             = ">=1.6.0"
}

# Terraform doesn't support "inheritance"
# So we have to pass all variables down
module assets_base {
  source = "../base"

  // We should uncomment this when
  // we find a good way to write the
  // cloud provider configs.
  // cloud_provider_config = ""
  // cloud_provider = "openstack"
  cloud_provider = ""

  ingress_kind = "haproxy-router"

  tectonic_admin_email          = "${var.tectonic_admin_email}"
  tectonic_admin_password       = "${var.tectonic_admin_password}"
  tectonic_admin_ssh_key        = "${var.tectonic_admin_ssh_key}"
  tectonic_base_domain          = "${var.tectonic_base_domain}"
  tectonic_cluster_cidr         = "${var.tectonic_cluster_cidr}"
  tectonic_cluster_id           = "${var.tectonic_cluster_id}"
  tectonic_cluster_name         = "${var.tectonic_cluster_name}"
  tectonic_container_images     = "${var.tectonic_container_images}"
  tectonic_image_re             = "${var.tectonic_image_re}"
  tectonic_kubelet_debug_config = "${var.tectonic_kubelet_debug_config}"
  tectonic_networking           = "${var.tectonic_networking}"
  tectonic_platform             = "${var.tectonic_platform}"
  tectonic_pull_secret          = "${var.tectonic_pull_secret}"
  tectonic_service_cidr         = "${var.tectonic_service_cidr}"
  tectonic_update_channel       = "${var.tectonic_update_channel}"
  tectonic_versions             = "${var.tectonic_versions}"
}
