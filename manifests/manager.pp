class role::manager {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::norpf

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  #include ::profile::monitoring::icingaclient
  include ::profile::munin::node

  # Manager-specific
  #include ::profile::managerbackups
  include ::profile::puppetdb
  include ::profile::tftpserver
}
