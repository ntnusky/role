# Installs a server that only runs monitoring checks of APIs and web services
class role::apimon {
  $installsensu = lookup('profile::sensu::install', {
    'default_value' => true,
    'value_type'    => Boolean,
  })

  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::ntnuopenstack::clients
  include ::ntnuopenstack::zabbix
  include ::profile::zabbix::agent::tls

  if ($installsensu) {
    include ::profile::sensu::plugin::http
  }
}
