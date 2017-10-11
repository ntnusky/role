# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::mysql::haproxy::frontend
  include ::profile::services::keepalived::haproxy::management
  include ::profile::services::puppetdb::haproxy::frontend 
  include ::profile::services::puppetmaster::haproxy::frontend
}
