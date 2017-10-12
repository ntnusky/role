# Installs and configures a puppetdb server.
class role::puppet::db {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::puppet::db
}
