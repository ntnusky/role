class role::manager {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  include ::profile::sensu::client
  include ::profile::munin::node

  # Manager-specific
  include ::profile::managerbackups
  include ::profile::services::puppetdb
  include ::profile::infrastructure::tftpserver
  include ::profile::baseconfig::sudo::foreman
}
