class role::openstack::designate::api {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    # Install the openstack designate server
    include ::ntnuopenstack::designate::api
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
