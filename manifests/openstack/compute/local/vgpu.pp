# Installs an openstack compute node with vGPU support.
# This compute-node places flavor-related storage on the compute-nodes local
# disks.
class role::openstack::compute::local::vgpu {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    # Openstack compute
    include ::ntnuopenstack::neutron::compute
    class { '::ntnuopenstack::nova::compute':
      localdisk => true,
    }
    include ::ntnuopenstack::nova::compute::vgpu
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
