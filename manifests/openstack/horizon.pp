class role::openstack::horizon {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the openstack dashboard
  include ::profile::openstack::horizon
}
