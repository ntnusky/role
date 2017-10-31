# rabbitmq hosts
class role::rabbitmq {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::services::rabbitmq
}
