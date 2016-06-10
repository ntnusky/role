class role::storage {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::norpf

  # Storage
  include ::profile::ceph::osd

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  #include ::profile::monitoring::icingaclient
  #include ::profile::munin::node
}
