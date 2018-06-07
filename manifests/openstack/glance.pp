class role::openstack::glance {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the glance service
  include ::ntnuopenstack::glance
}
