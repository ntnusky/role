# Installs a munin-server
class role::munin {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::munin::server
}
