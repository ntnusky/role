# Installs a secondary DNS server.
class role::dns::slave {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::dns::slave
}
