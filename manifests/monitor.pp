class role::monitor {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::norpf

  # Monitoring
  #include ::profile::monitoring::elk
  #include ::profile::monitoring::reverseproxy
  #include ::profile::monitoring::logstashforwarder
  #include ::profile::monitoring::icingaserver
  include ::profile::munin::master
  include ::profile::munin::node
}
