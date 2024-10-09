# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  if($::facts['openstack'] and $::facts['openstack']['region']) {
    include ::profile::bird

    $mysql = lookup('profile::mysqlcluster::root_password', {
      'defualt_value' => undef,
      'value_type'    => Optional[String],
    })
    if($mysql) {
      include ::profile::services::mysql::haproxy::frontend
    }

    $puppet = lookup('profile::puppetdb::database::pass', {
      'defualt_value' => undef,
      'value_type'    => Optional[String],
    })
    if($puppet) {
      include ::profile::services::puppet::db::haproxy::frontend
      include ::profile::services::puppet::server::haproxy::frontend
    }
  
    $shiftleader = lookup('shiftleader::params::web_name', {
      'defualt_value' => undef,
      'value_type'    => Optional[String],
    })
    if($shiftleader) {
      include ::profile::services::shiftleader::haproxy::frontend
    }
  
    $services = ['barbican', 'cinder', 'glance', 'heat', 'magnum', 'neutron',
      'nova', 'octavia', 'placement', 'switft']
    $services.each | $service | {
      $password = lookup("ntnuopenstack::${service}::keystone::password", {
        'defualt_value' => undef,
        'value_type'    => Optional[String],
      })
  
      if($password) {
        include "::ntnuopenstack::${service}::haproxy::management"
      }
    }
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
