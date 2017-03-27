class role::storage {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Storage
  include ::profile::ceph::osd

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
}
