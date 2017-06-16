class role::controller {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Include base services needed by openstack
  include ::profile::services::memcache
  include ::profile::services::rabbitmq
  include ::profile::mysql::cluster

  # Openstack controller
  include ::profile::openstack::clients
  include ::profile::openstack::keystone
  include ::profile::openstack::glance
  include ::profile::openstack::nova::api
  include ::profile::openstack::nova::services
  include ::profile::openstack::neutron::api
  include ::profile::openstack::neutron::network
  include ::profile::openstack::horizon
  include ::profile::openstack::cinder
  include ::profile::openstack::heat
  #include ::profile::openstack::neutronnetworks
  include ::profile::mysql::accessvm

  # Ceph
  include ::profile::ceph::monitor

  # Monitoring
  #include ::profile::monitoring::logstashforwarder
}
