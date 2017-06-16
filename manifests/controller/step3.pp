class role::controller::step3 {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  
  # Include base services needed by openstack
  include ::profile::services::memcache
  include ::profile::services::rabbitmq
  include ::profile::mysql::cluster

  # Ceph
  include ::profile::ceph::monitor
}
