class role::monitor {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::users
  include ::profile::nfs::client
  include ::profile::monitoring::elk
}
