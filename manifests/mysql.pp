# This role installs a mysql server
class role::mysql {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::mysql
  include ::profile::services::dashboard::mysql

  # Create various databases for us
  include ::profile::openstack::databases
}
