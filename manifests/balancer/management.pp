# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Configure keepalived to negotiate for the virtual IP
  include ::profile::services::keepalived::haproxy::management

  # Configure the frontend for all the services which should be balanced
  include ::profile::services::dashboard::haproxy::frontend
  include ::profile::services::mysql::haproxy::frontend
  include ::profile::services::puppet::db::haproxy::frontend
  include ::profile::services::puppet::server::haproxy::frontend
  include ::profile::services::redis::haproxy
  include ::profile::sensu::uchiwa::haproxy
  include ::profile::monitoring::munin::haproxy::backend

  # Configure the frontend for the openstack management api's
  include ::profile::openstack::cinder::haproxy::management
  include ::profile::openstack::glance::haproxy::management
  include ::profile::openstack::keystone::haproxy::management
}
