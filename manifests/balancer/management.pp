# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::bird

  # Configure the frontend for all the services which should be balanced
  include ::profile::services::mysql::haproxy::frontend
  include ::profile::services::puppet::db::haproxy::frontend
  include ::profile::services::puppet::server::haproxy::frontend
  include ::profile::services::redis::haproxy
  include ::profile::services::shiftleader::haproxy::frontend
  include ::profile::sensu::uchiwa::haproxy
  include ::profile::monitoring::munin::haproxy::backend

  $services = ['barbican', 'cinder', 'glance', 'heat', 'magnum', 'neutron',
    'nova', 'octavia', 'placement', 'switft']
  $services.each | $service | {
    $password = lookup("ntnuopenstack::${service}::keystone::password", {
      'defualt_value' => undef
      'value_type'    => Optional[String],
    })

    if($password) {
      include "::ntnuopenstack::${service}::haproxy::management"
    }
  }
}
