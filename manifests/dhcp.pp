# Installs a DHCP/TFTP server
class role::dhcp {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dhcp
  include ::profile::services::tftp
}
