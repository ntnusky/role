class role::klumpen {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::ceph::client
}
