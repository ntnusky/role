# Installs a DNS master
class role::dns::slave {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dns::slave
}
