# Server-role for the heat API servers
class role::openstack::heat::api {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the heat API
  include ::ntnuopenstack::heat::api
}
