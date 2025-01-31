# Installs a server that only runs monitoring checks of APIs and web services
class role::apimon {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    include ::ntnuopenstack::clients
    include ::ntnuopenstack::zabbix
    include ::profile::zabbix::agent::tls
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
