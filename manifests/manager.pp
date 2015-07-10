class role::manager {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::norpf
  include ::profile::monitoring::logstashforwarder
  include ::profile::managerbackups
  include ::profile::monitoring::icingaclient
}
