# Installs an openstack compute node
# This compute-node places flavor-related storage on the compute-nodes local
# disks.
class role::openstack::compute::local {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    # Openstack compute
    include ::ntnuopenstack::neutron::compute
    class { '::ntnuopenstack::nova::compute':
      localdisk => true,
    }
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
