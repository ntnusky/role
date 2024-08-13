# This role installs a mysql server joining a galera cluster
class role::zabbix {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Add bird so that the zabbix-boxes can announce an anycast-IP
  include ::profile::bird

  # Zabbix need a database-cluster
  include ::profile::services::mysql::cluster

  # Zabbix needs a database:
  include ::profile::zabbix::database

  include ::profile::zabbix::server

}
