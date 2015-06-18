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
  #include ::profile::corosync
  
  # Openstack controller
  include ::profile::openstack::keystone
  include ::profile::openstack::glance
  include ::profile::openstack::novacontroller
  include ::profile::openstack::neutronserver
  include ::profile::openstack::horizon
  #include ::profile::openstack::neutronnetworks
  
  # Ceph
  include ::profile::ceph::monitor
}
