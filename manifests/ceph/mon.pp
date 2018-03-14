class role::ceph::mon {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Ceph
  include ::profile::ceph::monitor
}
