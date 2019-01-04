class role::dashboard::dev {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dashboard
  include ::profile::services::dashboard::dev::firewall
}
