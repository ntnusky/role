# This role installs and configures a bootstrap machine, which is able to
# install the rest of the machines. The bootstrap role is a temporary role, and
# its services will be delivered by other roles later on in an redundant manner.
class role::bootstrap {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::tftp
}
