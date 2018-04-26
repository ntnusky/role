# This class installs a neutron api node
class role::openstack::neutron::api {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the glance service
  include ::profile::openstack::neutron::api
}
