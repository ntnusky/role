class role::controller::step2 {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  
  # Include base services needed by openstack
  include ::profile::services::memcache
  include ::profile::mysql::cluster
}
