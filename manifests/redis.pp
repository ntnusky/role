# redis host
class role::redis {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::services::redis
}
