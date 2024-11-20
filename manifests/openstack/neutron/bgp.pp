# This class installs a neutron bgp agent node 
class role::openstack::neutron::bgp {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    include ::ntnuopenstack::neutron::bgp
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
