# This role installs the haproxy which loadbalances the public services.
class role::balancer::services {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Configure keepalived to negotiate for the virtual IP
  include ::profile::services::keepalived::haproxy::services

  # Configure the frontend for all the services which should be balacned
  include ::ntnuopenstack::cinder::haproxy::services
  include ::ntnuopenstack::glance::haproxy::services
  include ::ntnuopenstack::heat::haproxy::services
  include ::ntnuopenstack::horizon::haproxy::frontend
  include ::ntnuopenstack::keystone::haproxy::services
  include ::ntnuopenstack::neutron::haproxy::services
  include ::ntnuopenstack::nova::haproxy::services
  include ::ntnuopenstack::swift::haproxy::services

  # We need the shiftleader backend to server the static info page
  include ::profile::services::dashboard::haproxy::frontend
}

