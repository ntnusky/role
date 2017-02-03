class role::monitor {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users

  # Monitoring
  include ::profile::munin::master
  include ::profile::munin::node
}
