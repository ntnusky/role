class role::storage {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::norpf
  include ::profile::ceph::osd
  include ::profile::monitoring::logstashforwarder
#  include ::profile::monitoring::icingaclient
}
