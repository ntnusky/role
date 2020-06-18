# Installs an openstack compute node with vGPU support
class role::openstack::compute::ceph::vgpu {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Storage
  include ::profile::ceph::client

  # Openstack compute
  include ::ntnuopenstack::neutron::compute
  include ::ntnuopenstack::nova::compute
  include ::ntnuopenstack::nova::vgpu
}
