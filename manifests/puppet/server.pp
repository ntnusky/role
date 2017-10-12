# This role installs a puppetserver
class role::puppet::server {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::puppet::server
}
