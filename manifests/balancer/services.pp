# This role installs the haproxy which loadbalances the public services.
class role::balancer::services {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Configure keepalived to negotiate for the virtual IP
  include ::profile::services::keepalived::haproxy::services

  # Configure the frontend for all the services which should be balacned
  include ::profile::openstack::keystone::haproxy::services
  include ::profile::openstack::glance::haproxy::services
}

