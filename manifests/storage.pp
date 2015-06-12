class role::storage {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::ceph::osd
  include ::profile::nfs::client
}
