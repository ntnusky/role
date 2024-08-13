# This role installs a mysql server joining a galera cluster
class role::mysql::cluster {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Zabbix need a database-cluster
  include ::profile::services::mysql::cluster
}
