# Openstack swift role. Installs a ceph rados gateway, and registers it in
# keystone as a swift node.
class role::openstack::swift {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    # Install the swift gateway 
    include ::ntnuopenstack::swift
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
