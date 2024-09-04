# This role installs a zabbix-proxy 
class role::zabbix::proxy {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::zabbix::proxy
}
