class role::controller {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Include base services needed by openstack
  include ::profile::services::memcache
  include ::profile::mysql::cluster

  # Openstack controller
  include ::profile::openstack::clients
  include ::profile::openstack::keystone
  include ::profile::openstack::glance
  include ::profile::openstack::novacontroller
  include ::profile::openstack::neutronserver
  include ::profile::openstack::horizon
  include ::profile::openstack::cinder
  include ::profile::openstack::heat
  #include ::profile::openstack::neutronnetworks
  include ::profile::munin::plugin::nova
  include ::profile::mysql::accessvm

  # Ceph
  include ::profile::ceph::monitor

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
  include ::profile::sensu::plugin::mysql
  include ::profile::sensu::plugin::rabbitmq
}
