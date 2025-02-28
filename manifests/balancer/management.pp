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

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    $keystone_region = lookup('ntnuopenstack::keystone::region', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    $region = lookup('ntnuopenstack::region')

    include ::profile::bird
    include ::profile::services::haproxy

    $mysql = lookup('profile::haproxy::mysql::enable', {
      'default_value' => true,
      'value_type'    => Boolean,
    })
    if($mysql) {
      include ::profile::services::mysql::haproxy::frontend
    }

    $puppet = lookup('profile::haproxy::puppet::enable', {
      'default_value' => true,
      'value_type'    => Boolean,
    })
    if($puppet) {
      include ::profile::services::puppet::server::haproxy::frontend
    }

    $puppetdb = lookup('profile::haproxy::puppetdb::enable', {
      'default_value' => true,
      'value_type'    => Boolean,
    })
    if($puppetdb) {
      include ::profile::services::puppet::db::haproxy::frontend
    }
  
    $shiftleader = lookup('profile::haproxy::shiftleader::enable', {
      'default_value' => true,
      'value_type'    => Boolean, 
    })
    if($shiftleader) {
      include ::profile::services::shiftleader::haproxy::frontend
    }

    if($keystone_region == undef or $keystone_region == $region) {
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
