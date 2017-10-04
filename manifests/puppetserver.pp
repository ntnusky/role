# This role installs a puppetserver
class role::puppetserver {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::puppetmaster
}
