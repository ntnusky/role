class role::openstack::placement {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the placement service
  include ::ntnuopenstack::placement::api
}
