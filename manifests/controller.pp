class role::controller {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  
  # Include base services needed by openstack
  include ::profile::memcache
  include ::profile::keepalived
  include ::profile::mysqlcluster
  include ::profile::rabbitmq
  include ::profile::norpf
  include ::profile::monitoring::logstashforwarder
  
  # Openstack controller
  include ::profile::openstack::keystone
  include ::profile::openstack::glance
  include ::profile::openstack::novacontroller
  include ::profile::openstack::neutronserver
  include ::profile::openstack::horizon
  include ::profile::openstack::cinder
  
  # Ceph
  include ::profile::ceph::monitor
}
