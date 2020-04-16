class role::openstack::octavia {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the openstack octavia controller
  include ::ntnuopenstack::octavia
}
