# This class installs a neutron network node
class role::openstack::neutron::network {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the neutron network node
  include ::ntnuopenstack::neutron::network
}
