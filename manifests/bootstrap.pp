# This role installs and configures a bootstrap machine, which is able to
# install the rest of the machines. The bootstrap role is a temporary role, and
# its services will be delivered by other roles later on in an redundant manner.
class role::bootstrap {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::mysql::cluster
  include ::profile::services::dashboard::mysql

  include ::profile::services::apache
  include ::profile::services::dashboard
  include ::profile::services::dns
  include ::profile::services::dhcp
  include ::profile::services::postgresql
  include ::profile::services::puppetdb::database
  include ::profile::services::puppetdb::server
  include ::profile::services::puppetmaster
  include ::profile::services::tftp

  Class['::profile::services::puppetdb::database'] ->
  Class['::profile::services::puppetdb::server'] ->
  Class['::profile::services::puppetmaster']
}
