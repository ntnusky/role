class role::controller {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Include base services needed by openstack
  include ::profile::services::memcache
  include ::profile::services::rabbitmq
  include ::profile::mysql::cluster

  # Openstack controller
  include ::ntnuopenstack::clients
  include ::ntnuopenstack::databases
  include ::ntnuopenstack::keystone
  include ::ntnuopenstack::glance
  include ::ntnuopenstack::nova::api
  include ::ntnuopenstack::nova::services
  include ::ntnuopenstack::neutron::api
  include ::ntnuopenstack::neutron::network
  include ::ntnuopenstack::horizon
  include ::ntnuopenstack::cinder
  include ::ntnuopenstack::heat
  include ::profile::mysql::accessvm

  # Ceph
  include ::profile::ceph::monitor
}
