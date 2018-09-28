# Role for bulk storage box called klumpen
class role::klumpen {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::ceph::client
  include ::ntnuopenstack::clients
}
