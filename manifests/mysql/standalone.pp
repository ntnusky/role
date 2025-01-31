# This role installs a stand-alone mysql server
class role::mysql::standalone {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    include ::profile::services::mysql::standalone
    include ::profile::services::mysql::databases

    # Create various databases for us
    include ::ntnuopenstack::databases
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
