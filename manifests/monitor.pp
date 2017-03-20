class role::monitor {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Monitoring
  include ::profile::munin::master
  include ::profile::munin::node

  include ::profile::sensu::server
  include ::profile::sensu::plugin::http
}
