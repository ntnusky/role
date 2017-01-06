class role::access {
  include ::profile::baseconfig
  include ::mysql::client
  include ::profile::sssd::accessvm
  include ::profile::openstack::clients
}
