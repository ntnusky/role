class role::storage {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::ceph::osd
}
