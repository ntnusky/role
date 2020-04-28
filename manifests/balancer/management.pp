# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Configure keepalived to negotiate for the virtual IP
  include ::profile::services::keepalived::haproxy::management
  # Add bird, if the preffered strategy to share a service-ip is anycast.
  include ::profile::bird

  # Configure the frontend for all the services which should be balanced
  include ::profile::services::dashboard::haproxy::frontend
  include ::profile::services::mysql::haproxy::frontend
  include ::profile::services::puppet::db::haproxy::frontend
  include ::profile::services::puppet::server::haproxy::frontend
  include ::profile::services::redis::haproxy
  include ::profile::sensu::uchiwa::haproxy
  include ::profile::monitoring::munin::haproxy::backend

  # Configure the frontend for the openstack management api's
  include ::ntnuopenstack::cinder::haproxy::management
  include ::ntnuopenstack::glance::haproxy::management
  include ::ntnuopenstack::heat::haproxy::management
  include ::ntnuopenstack::keystone::haproxy::management
  include ::ntnuopenstack::neutron::haproxy::management
  include ::ntnuopenstack::nova::haproxy::management

  # If there is a password defined for octavia, the service should be available.
  $octavia = lookup('ntnuopenstack::octavia::keystone::password', {
     'default_value' => false,
  })
  if($octavia) {
    include ::ntnuopenstack::octavia::haproxy::management
  }

  # If there is a password defined for switft, the service should be available.
  $swift = lookup('ntnuopenstack::swift::keystone::password', {
     'default_value' => false,
  })
  if($swift) {
    include ::ntnuopenstack::swift::haproxy::management
  }

  # If there is a password defined for barbican, the service should be available.
  $barbican = lookup('ntnuopenstack::barbican::keystone::password', {
    'default_value' => false,
  })
  if($barbican) {
    include ::ntnuopenstack::barbican::haproxy::management
  }

  # If there is a password defined for magnum, the service should be available.
  $magnum = lookup('ntnuopenstack::magnum::keystone::password', {
    'default_value' => false,
  })
  if($magnum) {
    include ::ntnuopenstack::magnum::haproxy::management
  }
}
