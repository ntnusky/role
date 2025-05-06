# This role installs a zabbix-server together with a galera-cluster. The role
# can thus become HA if you have several of them. 
class role::zabbix::server {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    # Add bird so that the zabbix-boxes can announce an anycast-IP
    include ::profile::bird

    # Zabbix need a database-cluster
    include ::profile::services::mysql::cluster

    # Zabbix needs a database:
    include ::profile::zabbix::database

    include ::profile::zabbix::server
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
