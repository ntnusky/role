class role::manager {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  #include ::profile::monitoring::icingaclient
  include ::profile::munin::node

  # Manager-specific
  include ::profile::managerbackups
  include ::profile::puppetdb
  include ::profile::infrastructure::tftpserver
}
