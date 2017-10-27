# KVM hosts
class role::kvm {
  include ::profile::baseconfig
  include ::profile::baseconfig::users
  include ::profile::services::libvirt
}
