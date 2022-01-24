# Installs an openstack compute node
# This compute-node places flavor-related storage on ceph 
class role::openstack::compute::ceph {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Openstack compute
  include ::ntnuopenstack::neutron::compute
  class { '::ntnuopenstack::nova::compute':
    localdisk => false,
  }
}
