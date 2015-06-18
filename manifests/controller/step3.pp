class role::controller::step3 {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  
  # Include base services needed by openstack
  include ::profile::memcache
  include ::profile::keepalived
  include ::profile::mysqlcluster
  include ::profile::rabbitmq
  include ::profile::norpf

  # Ceph
  include ::profile::ceph::monitor
}
