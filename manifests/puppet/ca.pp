# This role installs a puppetserver which is not part of the regular
# load-balancing. This is thus a good candidate for the puppetca role.
class role::puppet::ca {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::puppet::ca
}
