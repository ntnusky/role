# Installs the nova api
class role::openstack::nova::api {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Openstack controller
  include ::ntnuopenstack::nova::api
}
