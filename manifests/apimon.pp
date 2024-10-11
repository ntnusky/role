# Installs a server that only runs monitoring checks of APIs and web services
class role::apimon {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::ntnuopenstack::clients
  include ::ntnuopenstack::zabbix
  include ::profile::zabbix::agent::tls

}
