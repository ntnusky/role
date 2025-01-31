# This role installs the cinder API, scheduler and volume-service on a node.
# When the cinder-volumes are ceph-backed we dont want dedicated volume nodes.
class role::openstack::cinder {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    # Install the cinder service
    include ::ntnuopenstack::cinder
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
