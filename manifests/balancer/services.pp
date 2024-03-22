# This role installs the haproxy which loadbalances the public services.
class role::balancer::services {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Configure keepalived to negotiate for the virtual IP
  include ::profile::services::keepalived::haproxy::services
  # Add bird, if the preffered strategy to share a service-ip is anycast.
  include ::profile::bird

  # Configure the frontend for all the services which should be balacned
  include ::ntnuopenstack::cinder::haproxy::services
  include ::ntnuopenstack::glance::haproxy::services
  include ::ntnuopenstack::heat::haproxy::services
  include ::ntnuopenstack::horizon::haproxy::frontend
  include ::ntnuopenstack::keystone::haproxy::services
  include ::ntnuopenstack::neutron::haproxy::services
  include ::ntnuopenstack::nova::haproxy::services
  include ::ntnuopenstack::placement::haproxy::services

  # If there is a password defined for octavia, the service should be available.
  $octavia = lookup('ntnuopenstack::octavia::keystone::password', {
    'default_value' => false,
  })
  if($octavia) {
    include ::ntnuopenstack::octavia::haproxy::services
  }

  # If there is a password defined for switft, the service should be available.
  $swift = lookup('ntnuopenstack::swift::keystone::password', {
    'default_value' => false,
  })
  if($swift) {
    include ::ntnuopenstack::swift::haproxy::services
  }

  # If there is a password defined for barbican, the service should be available.
  $barbican = lookup('ntnuopenstack::barbican::keystone::password', {
    'default_value' => false,
  })
  if($barbican) {
    include ::ntnuopenstack::barbican::haproxy::services
  }

  # If there is a password defined for magnum, the service should be available.
  $magnum = lookup('ntnuopenstack::magnum::keystone::password', {
    'default_value' => false,
  })
  if($magnum) {
    include ::ntnuopenstack::magnum::haproxy::services
  }

  # We need the shiftleader backend to server the static info page
  include ::profile::services::dashboard::haproxy::frontend
  include ::profile::services::shiftleader::haproxy::frontend
}

