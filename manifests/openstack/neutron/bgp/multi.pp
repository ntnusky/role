# This class installs a neutron bgp agent node which can run multiple BGP
# agents. 
class role::openstack::neutron::bgp::multi {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    include ::ntnuopenstack::neutron::bgp::multi
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
