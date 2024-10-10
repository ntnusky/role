# This role installs the haproxy which loadbalances the public services.
class role::balancer::services {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    include ::profile::bird
    include ::profile::services::haproxy

    $services = ['barbican', 'cinder', 'glance', 'heat', 'magnum', 'neutron',
      'nova', 'octavia', 'placement', 'swift']
    $services.each | $service | {
      $password = lookup("ntnuopenstack::${service}::keystone::password", {
        'default_value' => undef,
        'value_type'    => Optional[String],
      })
  
      if($password) {
        include "::ntnuopenstack::${service}::haproxy::services"
      }
    }

    $horizon = lookup('ntnuopenstack::horizon::server_name', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($horizon) {
      include ::ntnuopenstack::horizon::haproxy::frontend
    }

    $keystone = lookup('ntnuopenstack::keystone::admin_password', {
      'default_value' => undef,
      'value_type'    => Optional[String],
    })
    if($keystone) {
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

