# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    include ::profile::bird
    include ::profile::services::haproxy

    $mysql = lookup('profile::mysql::root_password', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    $mysqlc = lookup('profile::mysqlcluster::root_password', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($mysql or $mysqlc) {
      include ::profile::services::mysql::haproxy::frontend
    }

    $puppet = lookup('profile::puppetdb::database::pass', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($puppet) {
      include ::profile::services::puppet::db::haproxy::frontend
      include ::profile::services::puppet::server::haproxy::frontend
    }
  
    $shiftleader = lookup('shiftleader::params::web_name', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($shiftleader) {
      include ::profile::services::shiftleader::haproxy::frontend
    }

    $keystone = lookup('ntnuopenstack::keystone::admin_password', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($keystone) {
      include ::ntnuopenstack::keystone::haproxy::management
    }
  
    $services = ['barbican', 'cinder', 'glance', 'heat', 'magnum', 'neutron',
      'nova', 'octavia', 'placement', 'switft']
    $services.each | $service | {
      $password = lookup("ntnuopenstack::${service}::keystone::password", {
        'default_value' => undef,
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
