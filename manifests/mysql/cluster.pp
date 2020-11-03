# This role installs a mysql server joining a galera cluster
class role::mysql::cluster {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::mysql::cluster
  include ::profile::services::dashboard::mysql

  # Create various databases for us
  include ::ntnuopenstack::databases
}
