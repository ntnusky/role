class role::openstack::keystone {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the keystone service
  include ::profile::openstack::keystone
}
