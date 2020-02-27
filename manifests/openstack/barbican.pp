# Install barbican profiles
class role::openstack::barbican {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install barbican
  include ::ntnuopenstack::barbican
}
