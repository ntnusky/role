class role::postgresql::slave {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Include the postgresql profile 
  include ::profile::services::postgresql
}
