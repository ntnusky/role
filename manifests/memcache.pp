# memcache hosts
class role::memcache {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::services::memcache
}
