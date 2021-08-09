# This role installs a mysql server joining a galera cluster
class role::mysql::cluster {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::mysql::cluster

  # Create various databases for us
  class { '::ntnuopenstack::databases':
    require => Class['::profile::services::mysql::cluster'],
  }
}
