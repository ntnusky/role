class role::dashboard {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dashboard
}
