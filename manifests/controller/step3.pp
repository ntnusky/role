class role::controller::step3 {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  
  # Include base services needed by openstack
  include ::profile::services::memcache
  include ::profile::mysql::cluster
  include ::profile::rabbitmq

  # Ceph
  include ::profile::ceph::monitor
}
