# This role installs the haproxy which loadbalances the public services.
class role::balancer::services {
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
    $region = lookup('ntnuopenstack::region')
    $keystone_region = lookup('ntnuopenstack::keystone::region')

    include ::profile::bird
    include ::profile::services::haproxy

    $servicenames = ['barbican', 'cinder', 'glance', 'heat', 'magnum', 'neutron',
      'nova', 'octavia', 'placement', 'swift']
    $servicenames.each | $service | {
      if($region in $services and $service in $services[$region]['services']) {
        include "::ntnuopenstack::${service}::haproxy::services"
      }
    }

    $horizon = lookup('ntnuopenstack::horizon::enabled', {
      'default_value' => true,
      'value_type'    => Boolean,
    })
    if($horizon) {
      include ::ntnuopenstack::horizon::haproxy::frontend
    }

    if($keystone_region == $region) {
      include ::ntnuopenstack::keystone::haproxy::services
    }

    $infopage = lookup('profile::info::maillist::fqdn', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($infopage) {
      include ::profile::services::shiftleader::haproxy::frontend
    }
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}

