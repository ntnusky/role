class role::shiftleader {
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  include ::profile::services::shiftleader
  include ::profile::services::info
}
