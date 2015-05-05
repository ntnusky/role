class role::controller {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  
  # Include base services needed by openstack
  include ::profile::memcache
  include ::profile::keepalived
  include ::profile::mysqlcluster
  include ::profile::rabbitmq
  
  # Openstack controller
  include ::profile::keystone
}
