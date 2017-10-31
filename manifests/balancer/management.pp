# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Configure keepalived to negotiate for the virtual IP
  include ::profile::services::keepalived::haproxy::management

  # Configure the frontend for all the services which should be balanced
  include ::profile::services::mysql::haproxy::frontend
  include ::profile::services::puppet::db::haproxy::frontend
  include ::profile::services::puppet::server::haproxy::frontend
  include ::profile::services::redis::haproxy
}
