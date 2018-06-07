# Installs the nova services
class role::openstack::nova::services {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Openstack controller
  include ::ntnuopenstack::nova::services
}
