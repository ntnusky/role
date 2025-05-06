# This class installs a neutron network node
class role::openstack::neutron::network {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    # Install the neutron network node
    include ::ntnuopenstack::neutron::network
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
