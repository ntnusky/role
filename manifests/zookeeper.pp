class role::zookeeper {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  # Include Zookeeper profile
  include ::profile::services::zookeeper
}
