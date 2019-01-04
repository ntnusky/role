# Installs a DNS master
class role::dns::master {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dns::master
}
