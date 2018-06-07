# Server-role for the heat engine servers
class role::openstack::heat::engine {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the heat engine
  include ::ntnuopenstack::heat::engine
}
