# This role installs a puppetserver which is not part of the regular
# load-balancing. This is thus a good candidate for the puppetca role.
class role::puppet::ca {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  $regionless = lookup('profile::region::missing::ok', {
    'default_value' => false,
    'value_type'    => Boolean,
  })

  if($regionless or ($::facts['ntnu'] and $::facts['ntnu']['region'])) {
    include ::profile::services::puppet::ca
  } else {
    notify { 'Base-Only':
      message => 'Only role::base applied due to missing region fact',
    }
  }
}
