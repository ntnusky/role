# Installs and configures a puppetdb server.
class role::puppetdb {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::puppetdb::server
}
