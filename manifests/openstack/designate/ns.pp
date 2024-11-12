class role::openstack::designate::ns {
  # Baseconfiguration. Should be on all hosts.
  include ::profile::baseconfig
  include ::profile::baseconfig::users

  # Install the nameserver for designate
  include ::ntnuopenstack::designate::ns
}
