class role::access {
  include ::profile::baseconfig
  include ::mysql::client
  include ::profile::sssd::accessvm
  include ::ntnuopenstack::clients
}
