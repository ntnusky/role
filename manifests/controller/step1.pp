class role::controller::step1 {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  
  # Include base services needed by openstack
  include ::profile::services::memcache
}
