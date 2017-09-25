class role::postgresql {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Include the postgresql profile 
  include ::profile::services::postgresql

  # Create databases
  include ::profile::services::puppetdb::database
}
