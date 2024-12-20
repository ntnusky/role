# This role installs a loadbalancer for all back-end services.
class role::balancer::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })
  $services = lookup('ntnuopenstack::services', {
    'value_type' => Hash[String, Hash],
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    $keystone_region = lookup('ntnuopenstack::keystone::region')
    $mysql = lookup('profile::mysql::root_password', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    $mysqlc = lookup('profile::mysqlcluster::root_password', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    $region = lookup('ntnuopenstack::region')

    include ::profile::bird
    include ::profile::services::haproxy

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

    if($keystone_region == $region) {
      include ::ntnuopenstack::keystone::haproxy::management
    }
  
    $servicenames = ['barbican', 'cinder', 'glance', 'heat', 'magnum', 'neutron',
      'nova', 'octavia', 'placement']
    $servicenames.each | $service | {
      if($region in $services and $service in $services[$region]['services']) {
        include "::ntnuopenstack::${service}::haproxy::management"
      }
    }
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
