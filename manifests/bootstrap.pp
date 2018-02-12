# This role installs and configures a bootstrap machine, which is able to
# install the rest of the machines. The bootstrap role is a temporary role, and
# its services will be delivered by other roles later on in an redundant manner.
class role::bootstrap {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::monitoring::munin::haproxy::backend
  include ::profile::sensu::uchiwa::haproxy
  include ::profile::services::apache
  include ::profile::services::dashboard
  include ::profile::services::dashboard::haproxy::frontend
  include ::profile::services::dashboard::mysql
  include ::profile::services::dhcp
  include ::profile::services::keepalived::haproxy::management
  include ::profile::services::mysql
  include ::profile::services::mysql::haproxy::frontend
  include ::profile::services::postgresql
  include ::profile::services::puppet::db
  include ::profile::services::puppet::db::database
  include ::profile::services::puppet::db::haproxy::frontend
  include ::profile::services::puppet::server
  include ::profile::services::puppet::server::haproxy::frontend
  include ::profile::services::redis::haproxy
  include ::profile::services::tftp


  # TODO: This role probably needs more ordering to work properly.
  Class['::profile::services::postgresql'] ->
  Class['::profile::services::puppet::db::database'] ->
  Class['::profile::services::puppet::db'] ->
  Class['::profile::services::puppet::server']

  Class['::profile::services::mysql'] ->
  Class['::profile::services::mysql::haproxy::frontend'] ->
  Class['::profile::services::dashboard::mysql'] ->
  Class['::profile::services::dashboard']
}
