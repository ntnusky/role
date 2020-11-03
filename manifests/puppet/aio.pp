# This role installs a puppetserver and puppetdb on the same host.
class role::puppet::aio {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::puppet::db
  include ::profile::services::puppet::aio
}
