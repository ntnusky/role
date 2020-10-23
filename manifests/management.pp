# Installs a management-utilities server. Contains DHCP/TFTP/Shiftleader.
class role::management {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dashboard
  include ::profile::services::dhcp
  include ::profile::services::tftp
}
