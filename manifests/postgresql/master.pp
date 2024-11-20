class role::postgresql::master {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['openstack'] and $::facts['openstack']['region'])) {
    # Include the postgresql profile 
    include ::profile::services::postgresql

    # Create databases
    include ::profile::services::puppet::db::database
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
