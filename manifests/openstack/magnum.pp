# Install magnum profiles
class role::openstack::magnum {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::ntnuopenstack::magnum
}
