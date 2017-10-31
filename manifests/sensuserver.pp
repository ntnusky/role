# Sensu server
class role::sensuserver {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::sensu::server
}
