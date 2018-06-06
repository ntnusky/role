# Installs a server that only runs sensu checks of APIs and web services
class role::apimon {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::ntnuopenstack::clients

  include ::profile::sensu::plugin::http
}
